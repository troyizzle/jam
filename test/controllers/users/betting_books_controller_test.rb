# frozen_string_literal: true
require 'test_helper'

module Users
  class BettingBooksControllerTest < ActionDispatch::IntegrationTest
    setup do
      @betting_book = betting_books(:prize_picks)
      @user = users(:example)
    end

    test 'should create user_betting_book' do
      sign_in @user
      @user.betting_books.destroy_all

      assert_difference('Users::BettingBook.count') do
        params = {
          users_betting_book: {
            betting_book_id: @betting_book.id,
            email: @user.email,
            password: 'password',
          },
        }
        post users_betting_books_path(format: :turbo_stream), params:
      end
    end
  end
end
