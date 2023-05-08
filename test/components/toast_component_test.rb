# frozen_string_literal: true

require 'test_helper'

class ToastComponentTest < ViewComponent::TestCase
  def test_renders_correct_styling_when_notice
    c = render_inline(ToastComponent.new(flash: ['notice', 'This is a notice']))

    assert_includes c.css("div[id='toast']").to_html, 'bg-[#34D399]'
  end

  def test_renders_correct_styling_when_alert
    c = render_inline(ToastComponent.new(flash: ['alert', 'This is a alert']))

    assert_includes c.css("div[id='toast']").to_html, 'bg-[#F87171]'
  end
end
