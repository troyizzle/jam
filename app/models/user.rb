# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable, omniauth_providers: [:discord]

  # Callbacks
  after_create -> { build_profile.save }
  before_validation :assign_username, if: -> { username.blank? }

  delegate :full_name, to: :profile

  # Relationships
  has_one :profile, dependent: :destroy
  has_many :betting_books, class_name: 'Users::BettingBook', dependent: :destroy
  has_many :bets, through: :betting_books, dependent: :destroy
  accepts_nested_attributes_for :profile,
                                update_only: true
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.save

      case auth.provider
      when 'discord' then user.profile.update_from_discord(auth.info)
      end
    end
  end

  def assign_username
    self.username = email.split('@').first
  end
end
