# frozen_string_literal: true
module SeedsHelper
  class << self
    def create_user!(name)
      email = "#{name}@example.com"

      attributes = {
        email:,
        password: 'password',
        password_confirmation: 'password',
      }

      User.find_or_create_by!(email:) do |user|
        user.assign_attributes(attributes)
      end
    end
  end
end
