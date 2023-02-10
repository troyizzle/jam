# frozen_string_literal: true

class Layout::HeroComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
