# frozen_string_literal: true

module Layout
  class DashboardComponent < ViewComponent::Base
    def initialize(user:)
      @user = user
    end

    def data
      return {} unless @user

      {
        controller: 'sidebar',
        sidebar_open_class: 'translate-x-0',
        sidebar_close_class: '-translate-x-full',
        sidebar_toggle_value: false,
        action: 'click@window->sidebar#close',
      }
    end
  end
end
