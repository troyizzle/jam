# frozen_string_literal: true

module Form
  class ButtonComponent < ViewComponent::Base
    attr_reader :form, :title, :wide

    def initialize(form, title:, wide: true)
      @form = form
      @title = title
      @wide = wide
    end

    def call
      tag.button title, form: form.id, type: 'submit', class: classes
    end

    private

    def classes
      class_names(
        'flex justify-center font-medium text-gray rounded bg-primary p-2', {
          "w-full": wide,
          "px-6": !wide,
        }
      )
    end
  end
end
