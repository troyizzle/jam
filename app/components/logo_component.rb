# frozen_string_literal: true

class LogoComponent < ViewComponent::Base
  def initialize(theme: nil)
    @theme = theme
  end

  def render_static_logo?
    @theme.present?
  end

  def icon
    "icons/brand/#{@theme}.svg"
  end
end
