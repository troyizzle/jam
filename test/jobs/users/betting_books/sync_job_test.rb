# frozen_string_literal: true

require 'test_helper'
require 'minitest/mock'
require 'json'

module Users
  module BettingBooks
    class SyncJobTest < ActiveJob::TestCase
      test 'syncs a user betting book' do
        user_betting_book = users_betting_books(:user_betting_book_one)

        PrizePicks::Client.stub_any_instance(:sign_in, sign_in) do
          PrizePicks::Client.stub_any_instance(:entries, entries) do
            PrizePicks::Client.stub_any_instance(:member_transactions, member_transactions) do
              assert_changes 'Bet.count', 2 do
                Users::BettingBooks::SyncJob.perform_now(user_betting_book.id)
                bet = user_betting_book.bets.find_by(prize_pick_id: 134928677)

                assert bet.won?
              end
            end
          end
        end
      end

      private

      def sign_in
        data = JSON.parse(File.read('test/fixtures/prize_picks/user.json'))
        PrizePicks::User.new(data)
      end

      def entries
        data = JSON.parse(File.read('test/fixtures/prize_picks/entries.json'))
        PrizePicks::Collection.from_response(data, type: PrizePicks::Entry)
      end

      def member_transactions
        data = JSON.parse(File.read('test/fixtures/prize_picks/member_transactions.json'))
        parsed = parse_resp(data)
        PrizePicks::Collection.from_response(parsed, type: PrizePicks::MemberTransaction)
      end

      def parse_resp(resp)
        { 'data' => resp.map { |r| r }, 'included' => [] }
      end
    end
  end
end
