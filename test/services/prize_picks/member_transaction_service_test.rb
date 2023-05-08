# frozen_string_literal: true
require 'test_helper'
require 'json'

module PrizePicks
  class MemberTransactionServiceTest < ActiveSupport::TestCase
    def setup
      @data = JSON.parse(File.read('test/fixtures/prize_picks/member_transaction.json'))
      @member_transaction = PrizePicks::MemberTransaction.new(@data)
      @user_betting_book = users_betting_books(:user_betting_book_one)
    end

    test 'creates a new transaction' do
      assert_changes 'Bets::Transaction.count' do
        PrizePicks::MemberTransactionService.call(@user_betting_book, @member_transaction)
        transaction = Bets::Transaction.last

        assert_equal @user_betting_book, transaction.users_betting_book
        assert_equal transaction.transaction_id, @member_transaction.data['id'].to_i
      end
    end
  end
end
