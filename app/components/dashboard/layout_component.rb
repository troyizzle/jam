# frozen_string_literal: true

module Dashboard
  class LayoutComponent < ViewComponent::Base
    MAX_W_DIV_CLASSES = {
      'sm' => 'mx-auto max-w-270',
    }.freeze

    def initialize(page_title: nil, max_w_div_classes: nil)
      @page_title = page_title
      @max_w_div_classes = max_w_div_classes
    end

    def max_w_div_classes
      return '' if @max_w_div_classes.nil?

      MAX_W_DIV_CLASSES[@max_w_div_classes]
    end

    def render_page_title?
      @page_title.present?
    end
  end
end
