# frozen_string_literal: true

class ToastComponent < ViewComponent::Base
  BG_STYLES = {
    'notice': 'bg-[#34D399]',
    'alert': 'bg-[#F87171]',
  }.freeze

  def initialize(flash:)
    @flash_type, @message = flash
  end

  def div_classes
    class_names('flex w-full border-l-6 border-[#34D399] bg-[#34D399] bg-opacity-[15%] dark:bg-opacity-30 px-7 py-8 shadow-md md:p-9', {
      'border-[#34D399] bg-[#34D399]': @flash_type == 'notice',
      'border-[#F87171] bg-[#F87171]': @flash_type == 'alert',
    })
  end

  def icon_background
    case @flash_type
    when 'notice'
      'bg-[#34D399]'
    when 'alert'
      'bg-[#F87171]'
    end
  end

  def icon
    case @flash_type
    when 'notice'
      'icons/solid/check.svg'
    when 'alert'
      'icons/solid/x.svg'
    else
      'icons/solid/check.svg'
    end
  end
end
