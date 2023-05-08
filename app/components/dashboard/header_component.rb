# frozen_string_literal: true

module Dashboard
  class HeaderComponent < ViewComponent::Base
    def initialize(user:)
      @user = user
    end

    def render_toggle_button?
      @user.present?
    end

    def render_notification?
      @user.present?
    end

    def render_user_menu?
      @user.present?
    end
  end
end
