# frozen_string_literal: true

module Dashboard
  class CardComponent < ViewComponent::Base
    def initialize(text:, icon:, value:, percentage:)
      @text = text
      @icon = icon
      @value = value
      @percentage = percentage
    end

    def icon
      "icons/#{@icon}"
    end

    def percentage
      return 'NA' if @percentage.nil? || @percentage.zero?

      @percentage.positive? ? "+#{@percentage}%" : "#{@percentage}%"
    end

    def span_class
      class_names('flex items-center gap-1 font-medium text-sm', {
        'text-meta-3': @percentage.positive?,
        'text-meta-1': @percentage.negative?,
      })
    end

    def arrow
      @percentage.positive? ? 'up' : 'down'
    end

    def arrow_class
      class_names('w-3 h-3', {
        'fill-meta-3': @percentage.positive?,
        'fill-meta-1': @percentage.negative?,
      })
    end
  end
end
