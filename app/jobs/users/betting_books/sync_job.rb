# frozen_string_literal: true

module Users
  module BettingBooks
    class SyncJob < ApplicationJob
      queue_as :default

      # This job will first sign the user in, and sync all the user related data
      # after it will sync all the users entries to bets and then
      # sync all the transactions related to the bets
      def perform(user_betting_book_id)
        @user_betting_book = Users::BettingBook.find(user_betting_book_id)
        initialize_client
        sync_user_data
        sync_entries_data
        sync_member_transactions

        @user_betting_book.synced!
      end

      private

      def initialize_client
        @client = PrizePicks::Client.new(email: @user_betting_book.email, password: @user_betting_book.password)
      end

      def sync_user_data
        @user_data = @client.sign_in
        PrizePicks::UserService.call(@user_betting_book, @user_data)
      end

      def sync_entries_data
        data = @client.entries(filter: 'all')
        data.data.each do |entry|
          PrizePicks::EntryService.call(@user_betting_book, entry)
        end
      end

      def sync_member_transactions
        dates = months_and_years(@user_data.created_at)
        dates.each do |date|
          month = Date::MONTHNAMES[date[:month]]
          resp = @client.member_transactions(month:, year: date[:year])
          resp.data.each do |transaction|
            PrizePicks::MemberTransactionService.call(@user_betting_book, transaction)
          end
        end
      end

      def months_and_years(join_date)
        join_date = join_date.to_date
        dates = []
        while join_date <= Date.today
          dates << { month: join_date.month, year: join_date.year }
          join_date = join_date.next_month
        end
        dates
      end
    end
  end
end
