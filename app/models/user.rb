# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable, omniauth_providers: [:discord]

  # Callbacks
  after_create :make_profile

  # Relationships
  has_one :profile, dependent: :destroy
  has_many :bets, dependent: :destroy
  accepts_nested_attributes_for :profile,
                                update_only: true
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.save

      user.add_info_to_profile(auth.info)
    end
  end

  def add_info_to_profile(info)
    p = profile || build_profile
    first_name, last_name = info.name.split(' ')
    p.first_name = first_name
    p.last_name = last_name
    p.avatar_url = info.image
    p.save
  end

  private

  def make_profile
    build_profile.save
  end
end
