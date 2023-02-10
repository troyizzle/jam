# frozen_string_literal: true

module Form
  class FieldComponent < ViewComponent::Base
    renders_one :input, types: {
      date: ->(**args) { DateInputComponent.new(form, field, classes:, **args) },
      file: ->(**args) { FileInputComponent.new(form, field, classes:, **args) },
      text: ->(**args) { TextInputComponent.new(form, field, classes:, **args) },
      password: ->(**args) { PasswordInputComponent.new(form, field, classes:, **args) }
    }

    attr_reader :form, :field, :label, :helg

    def initialize(form, field, label: nil, help: nil)
      @form = form
      @field = field
      @label = label
      @help = help
    end

    def classes
      class_names('appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-gray-500 focus:border-gray-500 sm:text-sm dark:bg-gray-700  dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:text-white shadow-md', {
                    "border-rose-500": errors?,
                    "dark:border-gray-600": !errors?
                  })
    end

    private

    def errors?
      form.object.errors[field].any?
    end
  end
end
