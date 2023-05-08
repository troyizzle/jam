# frozen_string_literal: true
require 'test_helper'

class BetTest < ActiveSupport::TestCase
  test 'bet is valid' do
    bet = bets(:bet_one)
    assert bet.valid?, "Bet is not valid: #{bet.errors.full_messages}"
  end

  test 'bet can belong to a users_betting_book' do
    bet = bets(:bet_one)
    assert bet.users_betting_book.present?
  end
end
