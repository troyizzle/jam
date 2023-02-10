# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar

  validates :first_name,
            format: { with: /\A[a-zA-Z]+\z/ },
            allow_blank: true

  validates :last_name,
            format: { with: /\A[a-zA-Z]+\z/ },
            allow_blank: true

  # TODO: This could be handled by `validates_comparison_of`
  # but getting this error in form `wrong number of arguments (given 1, expected 0)`
  validate :date_of_birth_not_in_future
  #   validates_comparison_of :date_of_birth,
  #                           less_than_or_equal_to: -> { Date.today }

  private

  def date_of_birth_not_in_future
    return unless date_of_birth.present?

    errors.add(:date_of_birth, 'can not be in future') if date_of_birth >= Date.today
  end
end
