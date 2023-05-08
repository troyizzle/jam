# frozen_string_literal: true
module PrizePicks
  class UserService < ApplicationService
    def initialize(user_betting_book, user_data)
      @user_betting_book = user_betting_book
      @user_data = user_data
    end

    def call
      @user_betting_book.update!(
        deposited_amount: @user_data.deposited_amount
      )
    end
  end
end
