# frozen_string_literal: true

module PrizePicks
  class MemberTransactionService < ApplicationService
    def initialize(user_betting_book, transaction)
      @user_betting_book = user_betting_book
      @transaction = transaction
    end

    def call
      bet = find_bet
      transaction = bet.transactions.find_or_initialize_by(
        prize_pick_id: prize_pick_id
      )

      transaction.update!(
        bet: find_bet,
        data: @transaction.data
      )
    end

    private

    def prize_pick_id
      @transaction.data['id']
    end

    def find_bet
      Bet.find_by(
        prize_pick_id: @transaction.data.dig('attributes', 'object', 'data', 'id')
      )
    end
  end
end
