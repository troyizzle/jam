# frozen_string_literal: true

require 'open-uri'

class Profile < ApplicationRecord
  include HasSocialProfiles
  include Hashid::Rails

  belongs_to :user

  # Callbacks
  before_create :assign_defaults

  has_one_attached :avatar
  has_one_attached :cover_image

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

  def full_name
    [first_name, last_name].join(' ')
  end

  def update_from_discord(info)
    first_name, last_name = info.name.split(' ')
    self.first_name = first_name
    self.last_name = last_name
    attach_remote_avatar(info.image)
    save
  end

  private

  def assign_defaults
    attach_default_avatar unless avatar.attached?
    attach_default_cover_image unless cover_image.attached?
  end

  def attach_default_avatar
    file_name = 'default_avatar.png'
    file_path = Rails.root.join('app', 'assets', 'images', file_name)
    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file_path),
      filename: file_name
    )

    avatar.attach(blob)
  end

  def attach_default_cover_image
    file_name = 'default_splash.png'
    file_path = Rails.root.join('app', 'assets', 'images', file_name)
    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file_path),
      filename: file_name
    )

    cover_image.attach(blob)
  end

  def attach_remote_avatar(url)
    return if url.blank?

    avatar.attach(io: URI.open(url), filename: 'avatar.jpg')
  end

  def date_of_birth_not_in_future
    return unless date_of_birth.present?

    errors.add(:date_of_birth, 'can not be in future') if date_of_birth >= Date.today
  end
end
