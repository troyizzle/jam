module BettingBooks
  module Link
    class SyncedComponent < BaseComponent
      def initialize(betting_book:)
        @betting_book = betting_book
      end
    end
  end
end
