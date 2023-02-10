# frozen_string_literal: true

module Form
  class ButtonComponent < ViewComponent::Base
    attr_reader :form, :title

    def initialize(form, title:)
      @form = form
      @title = title
    end

    def call
      tag.button title, form: form.id, type: 'submit', class: classes
    end

    private

    def classes
      "w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-gray-600 hover:bg-gray-700 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500"
    end
  end
end
