# frozen_string_literal: true

module Dashboard
  class UserMenuLinkComponent < ViewComponent::Base
    def initialize(url:, text:, icon:)
      @url = url
      @text = text
      @icon = icon
    end
  end
end
