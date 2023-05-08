# frozen_string_literal: true

class Bet < ApplicationRecord
  belongs_to :users_betting_book, class_name: 'Users::BettingBook'
  has_many :transactions, class_name: 'Bets::Transaction', dependent: :destroy

  scope :finished_between, lambda { |start_date, end_date|
    not_pending
      .where(date_settled: start_date..end_date)
  }

  enum status: {
    pending: 0,
    won: 1,
    lost: 2,
  }
end
