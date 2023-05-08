# frozen_string_literal: true
require 'test_helper'

module Users
  class BettingBookTest < ActiveSupport::TestCase
    test 'is valid' do
      betting_book = users_betting_books(:user_betting_book_one)
      assert betting_book.valid?
    end

    test 'can have many bets' do
      betting_book = users_betting_books(:user_betting_book_one)
      assert betting_book.bets.count.positive?
    end
  end
end
