# frozen_string_literal: true

module Bets
  class Transaction < ApplicationRecord
    belongs_to :bet, optional: true

    after_create :update_date_settled

    def date_settled
      data.dig('attributes', 'updated_at')
    end

    def parse_status
      case data.dig('attributes', 'transaction_type')
      when 'entry_won' then Bet.statuses[:won]
      when 'entry_lost' then Bet.statuses[:lost]
      when 'entry_placed' then Bet.statuses[:pending]
      else Bet.statuses[:pending]
      end
    end

    def pending?
      r = data.dig('attributes', 'object', 'data', 'attributes', 'result')
      r == 'pending'
    end

    def update_date_settled
      return if pending? || !bet

      bet.update(date_settled:,
                 status: parse_status)
    end
  end
end
