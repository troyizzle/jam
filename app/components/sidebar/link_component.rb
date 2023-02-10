# frozen_string_literal: true

module Sidebar
  class LinkComponent < ViewComponent::Base
    def initialize(title:, link:, icon:)
      @title = title
      @link = link
      @icon = icon
    end

    def icon_element
      tag.i class: @icon
    end
  end
end
