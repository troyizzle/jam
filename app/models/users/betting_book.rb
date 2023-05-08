# frozen_string_literal: true
module Users
  class BettingBook < ApplicationRecord
    encrypts :password

    after_update_commit do
      broadcast_replace_to 'linked_betting_accounts',
                           target: "users_betting_book_#{id}",
                           partial: 'users/betting_books/link',
                           locals: { betting_book:, user:, user_betting_book: self }
    end

    has_many :bets, class_name: 'Bet', dependent: :destroy,
      inverse_of: :users_betting_book,
      foreign_key: :users_betting_book_id
    belongs_to :user
    belongs_to :betting_book, class_name: '::BettingBook'

    delegate :name, to: :betting_book

    validates :email, presence: true
    validates :password, presence: true
    validates :betting_book, uniqueness: { scope: :user }

    enum status: {
      unsynced: 0,
      syncing: 1,
      synced: 2,
      error: 3,
    }

    def sync!
      update!(status: :syncing)
    end

    def synced!
      update!(
        status: :synced,
        last_synced_at: Time.current
      )
    end
  end
end
