# frozen_string_literal: true

module Sidebar
  class LinkComponent < ViewComponent::Base
    def initialize(url:, text:, icon:)
      @url = url
      @text = text
      @icon = icon
    end
  end
end
