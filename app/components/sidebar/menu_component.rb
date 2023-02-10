# frozen_string_literal: true

module Sidebar
  class MenuComponent < ViewComponent::Base
    renders_many :links, lambda { |title:, link:, icon:|
      LinkComponent.new(title:, link:, icon:)
    }

    def initialize; end

    def icon_element
      tag.i class: @icon
    end
  end
end
