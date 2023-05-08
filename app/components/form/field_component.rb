# frozen_string_literal: true

module Form
  class FieldComponent < ViewComponent::Base
    renders_one :input, types: {
      date: ->(**args) { DateInputComponent.new(form, field, classes:, **args) },
      file: ->(**args) { FileInputComponent.new(form, field, classes:, **args) },
      text: ->(**args) { TextInputComponent.new(form, field, classes:, **args) },
      text_area: ->(**args) { TextAreaInputComponent.new(form, field, classes:, **args) },
      password: ->(**args) { PasswordInputComponent.new(form, field, classes:, **args) },
    }

    attr_reader :form, :field, :label, :helg

    def initialize(form, field, label: nil, help: nil)
      @form = form
      @field = field
      @label = label
      @help = help
    end

    def classes
      class_names('w-full min-w-0 bg-gray rounded border border-stroke focus-visible:outline-none focus:border-primary dark:focus:border-primary text-black dark:text-white py-3 pr-4.5 dark:bg-meta-4 dark:border-strokedark pl-5.5', {
        "border-meta-1": errors?,
        "border-stroke dark:border-form-strokedark": !errors?,
      })
    end

    private

    def errors?
      form.object.errors[field].any?
    end
  end
end
