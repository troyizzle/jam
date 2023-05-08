# frozen_string_literal: true
module Form
  class PasswordInputComponent < BaseComponent
    def initialize(form, field, classes:, data: {})
      @data = data
      super(form, field, classes:)
    end

    def call
      form.password_field(field, class: classes, data: @data)
    end
  end
end
