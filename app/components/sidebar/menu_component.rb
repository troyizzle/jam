# frozen_string_literal: true

module Sidebar
  class MenuComponent < ViewComponent::Base
    def initialize(user:)
      @user = user
    end

    def links
      [
        { url: dashboard_path, text: 'Dashboard', icon: 'icons/solid/gear.svg' },
        { url: profile_path(@user.profile), text: 'Profile', icon: 'icons/solid/user.svg' },
        { url: settings_path, text: 'Settings', icon: 'icons/solid/gear.svg' }
      ]
    end

    def render_content?
      @user.present?
    end
  end
end
