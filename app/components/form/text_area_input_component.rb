# frozen_string_literal: true

module Form
  class TextAreaInputComponent < BaseComponent
    attr_reader :form, :field, :classes

    def initialize(form, field, classes:, extra_classes: nil, placeholder: nil)
      super(form, field, classes:)
      @placeholder = placeholder
      @extra_classes = extra_classes
    end

    def call
      form.text_area(field, class: styling, placeholder: @placeholder)
    end

    private

    def styling
      return classes unless @extra_classes.present?

      "#{classes} #{@extra_classes}"
    end
  end
end
