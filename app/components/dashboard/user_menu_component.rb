# frozen_string_literal: true

module Dashboard
  class UserMenuComponent < ViewComponent::Base
    def initialize(user:)
      @user = user
    end

    def links
      [
        { icon: 'icons/outline/user.svg', text: 'My Profile', url: profile_path(@user.profile) },
        { icon: 'icons/outline/cog.svg', text: 'Account Settings', url: settings_path }
      ]
    end
  end
end
