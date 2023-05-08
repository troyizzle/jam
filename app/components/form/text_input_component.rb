# frozen_string_literal: true

module Form
  class TextInputComponent < BaseComponent
    attr_reader :form, :field, :classes

    def initialize(form, field, classes:, extra_classes: nil, type: :text, placeholder: nil)
      super(form, field, classes:)
      @type = type
      @extra_classes = extra_classes
      @placeholder = placeholder
    end

    def call
      form.send(method, field, class: styling, placeholder: @placeholder)
    end

    private

    def styling
      return classes unless @extra_classes.present?

      "#{classes} #{@extra_classes}"
    end

    def method
      "#{@type}_field"
    end
  end
end
