# frozen_string_literal: true

class BettingBook < ApplicationRecord
  validates :name, presence: true

  has_many :users_betting_books, dependent: :nullify, class_name: 'Users::BettingBook'

  scope :with_user_books, lambda { |user|
    includes(:users_betting_books).where(users_betting_books: { user: [user, nil] })
  }

  scope :enabled_first, -> { order(enabled: :desc) }
end
