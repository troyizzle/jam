# frozen_string_literal: true
module Form
  class BaseComponent < ViewComponent::Base
    attr_reader :form, :field, :classes

    def initialize(form, field, classes:)
      @form = form
      @field = field
      @classes = classes
    end
  end
end
