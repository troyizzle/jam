# frozen_string_literal: true

module Form
  class TextInputComponent < BaseComponent
    attr_reader :form, :field, :classes

    def initialize(form, field, classes:, type: :text)
      super(form, field, classes:)
      @type = type
    end

    def call
      form.send(method, field, class: classes)
    end

    private

    def method
      "#{@type}_field"
    end
  end
end
