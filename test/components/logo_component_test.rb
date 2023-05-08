# frozen_string_literal: true

require 'test_helper'

class LogoComponentTest < ViewComponent::TestCase
  def test_component_renders_both_icons_when_no_theme
    render_inline(LogoComponent.new)

    assert_selector 'svg', count: 2
  end

  def test_component_renders_specified_theme_dark
    render_inline(LogoComponent.new(theme: 'logo-dark'))

    assert_selector 'svg', count: 1
  end

  def test_component_renders_specified_theme_light
    render_inline(LogoComponent.new(theme: 'logo'))

    assert_selector 'svg', count: 1
  end
end
