require "test_helper"

class FieldErrorTagBuilderTest < ActiveSupport::TestCase
  setup do
    @instance = Struct.new(:error_message).new(["one error", "two error", "three error"])
  end

  test "does not append border class on label tag" do
    html_tag = %(<label class="bg-gray-200 font-medium text-gray-200">Test Label</label>)
    builder = FieldErrorTagBuilder.new(html_tag, @instance)

    assert_not builder.error_field.include?(FieldErrorTagBuilder::ERROR_BORDER_CLASS)
  end

  test "appends error border color on input tag" do
    html_tag = %(<input class="bg-gray-200 font-medium text-gray-200">Test Label</input>)
    builder = FieldErrorTagBuilder.new(html_tag, @instance)

    builder.error_field.include?(FieldErrorTagBuilder::ERROR_BORDER_CLASS)
  end
end
