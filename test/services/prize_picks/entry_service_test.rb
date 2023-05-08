# frozen_string_literal: true
require 'test_helper'
require 'json'

module PrizePicks
  class EntryServiceTest < ActiveSupport::TestCase
    def setup
      @data = JSON.parse(File.read('test/fixtures/prize_picks/entry.json'))
    end

    test 'creates an entry' do
      entry = PrizePicks::Entry.new(@data)
      user_betting_book = users_betting_books(:user_betting_book_one)
      PrizePicks::EntryService.call(user_betting_book, entry)
      bet = user_betting_book.user.bets.last

      assert_equal 'pending', bet.status
      assert_equal 20, bet.stake
      assert_equal 0, bet.result
      assert_equal Date.new(2023, 2, 16), bet.date_placed.to_date
      assert_equal 'PrizePicks', bet.book
      assert_equal user_betting_book, bet.users_betting_book
      assert_equal '134928677', bet.book_id
    end

    test 'updates an entry if existing' do
      entry = PrizePicks::Entry.new(@data)
      user_betting_book = users_betting_books(:user_betting_book_one)
      PrizePicks::EntryService.call(user_betting_book, entry)
      bet = user_betting_book.user.bets.last

      assert_equal 'pending', bet.status
      assert_equal 20, bet.stake
      assert_equal 0, bet.result
      assert_equal Date.new(2023, 2, 16), bet.date_placed.to_date
      assert_equal 'PrizePicks', bet.book
      assert_equal user_betting_book, bet.users_betting_book
      assert_equal '134928677', bet.book_id

      @data['data']['attributes']['result'] = 'won'
      @data['data']['attributes']['updated_at'] = '2023-02-24T00:00:00.000Z'
      @data['data']['attributes']['amount_won_cents'] = 4000
      entry = PrizePicks::Entry.new(@data)
      PrizePicks::EntryService.call(user_betting_book, entry)
      bet.reload

      assert_equal 'won', bet.status
      assert_equal 20, bet.stake
      assert_equal 40, bet.won
      assert_equal Date.new(2023, 2, 16), bet.date_placed.to_date
      assert_equal 'PrizePicks', bet.book
      assert_equal user_betting_book, bet.users_betting_book
      assert_equal '134928677', bet.book_id
    end
  end
end
