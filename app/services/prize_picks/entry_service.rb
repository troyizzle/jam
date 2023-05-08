# frozen_string_literal: true
module PrizePicks
  class EntryService < ApplicationService
    def initialize(user_betting_book, entry)
      @user_betting_book = user_betting_book
      @entry = entry
      @bets = @user_betting_book.bets
    end

    def call
      parse_attributes
      bet = @bets.find_or_initialize_by(prize_pick_id: prize_pick_id)
      bet.update!(
        status: @status,
        stake: @stake,
        date_placed: @entry.created_at,
        users_betting_book: @user_betting_book,
        prize_pick_id: prize_pick_id,
        data: @entry.data
      )
    end

    private

    def prize_pick_id
      @entry.data['id']
    end

    def parse_attributes
      @attributes = @entry
      parse_status_and_result
      parse_stake
    end

    def parse_status_and_result
      @status = case @entry.result
                when 'pending'
                  @result = 0
                  Bet.statuses[:pending]
                when 'lost'
                  @result = -@attributes['amount_bet_cents'] / 100
                  Bet.statuses[:lost]
                when 'won'
                  @result = @attributes['amount_won_cents'] / 100
                  Bet.statuses[:won]
                else
                  Rails.logger.error("Unknown status: #{@entry.result}")
                  Bet.statuses[:pending]
                end
    end

    def parse_stake
      @stake = @attributes['amount_bet_cents'] / 100
    end
  end
end
