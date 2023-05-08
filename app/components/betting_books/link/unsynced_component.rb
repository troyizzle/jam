# frozen_string_literal: true

module BettingBooks
  module Link
    class UnsyncedComponent < BaseComponent
      def initialize(betting_book:)
        @betting_book = betting_book
      end
    end
  end
end
