# frozen_string_literal: true

module BettingBooks
  module Link
    class BaseComponent < ViewComponent::Base
      def initialize(betting_book:, user:, user_betting_book:)
        @betting_book = betting_book
        @user = user
        @user_betting_book = user_betting_book
      end

      def component
        return DisabledComponent.new(betting_book: @betting_book) unless @betting_book.enabled?
        return UnsyncedComponent.new(betting_book: @betting_book) if unsynced?

        if @user_betting_book.syncing?
          SyncingComponent.new(betting_book: @betting_book)
        else
          SyncedComponent.new(betting_book: @betting_book)
        end
      end

      def component_id
        dom_id(@user_betting_book || @betting_book)
      end

      def icon
        "icons/brand/#{@betting_book.name.downcase}.svg"
      end

      def unsynced?
        return true if @user_betting_book.nil?
      end
    end
  end
end
