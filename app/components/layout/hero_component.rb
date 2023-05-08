# frozen_string_literal: true

module Layout
  class HeroComponent < ViewComponent::Base
    def initialize(title:)
      @title = title
    end
  end
end
