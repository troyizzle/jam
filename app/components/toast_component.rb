# frozen_string_literal: true

class ToastComponent < ViewComponent::Base
  FLASH_TYPE_COLORS = {
    'notice' => 'bg-teal-100 text-teal-900 border-teal-500',
    'success' => 'bg-green-300 text-teal-900 border-green-500',
    'alert' => 'bg-red-500 text-white'
  }.freeze

  def initialize(flash:)
    @flash = flash
    @flash_type, @message = @flash
  end

  def flash_color_classes
    FLASH_TYPE_COLORS[@flash_type]
  end
end
