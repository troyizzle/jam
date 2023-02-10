# frozen_string_literal: true

require 'test_helper'

class TitleComponentTest < ViewComponent::TestCase
  def test_component_renders_with_title
    render_inline(TitleComponent.new('Foo'))

    assert_selector('h2', text: 'Foo')
  end
end
