# frozen_string_literal: true
require 'test_helper'

class BettingBookTest < ActiveSupport::TestCase
  test 'is not valid without name' do
    betting_book = BettingBook.new
    assert_not betting_book.valid?
  end

  test 'is valid with name' do
    betting_book = BettingBook.new(name: 'Test')
    assert betting_book.valid?
  end

  test 'with_user_books scope returns betting books with user books' do
    user = users(:example)
    betting_book = betting_books(:prize_picks)
    betting_book.users_betting_books.create(user:)

    scope = BettingBook.with_user_books(user)

    assert_equal BettingBook.count, scope.count
    assert_equal betting_book, betting_books.first
  end
end
