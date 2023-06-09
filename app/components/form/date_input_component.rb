# frozen_string_literal: true

module Form
  class DateInputComponent < BaseComponent
    attr_reader :form, :field, :classes

    def call
      form.date_field(field, class: classes)
    end
  end
end
