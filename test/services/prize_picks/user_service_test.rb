# frozen_string_literal: true
require 'test_helper'
require 'json'

module PrizePicks
  class UserServiceTest < ActiveSupport::TestCase
    def setup
      @data = JSON.parse(File.read('test/fixtures/prize_picks/user.json'))
    end

    test 'syncs user data' do
      user = PrizePicks::User.new(@data)
      user_betting_book = users_betting_books(:one)
      PrizePicks::UserService.call(user_betting_book, user)
      user_betting_book.reload

      assert_equal 325, user_betting_book.deposited_amount
    end
  end
end
