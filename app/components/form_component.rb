# frozen_string_literal: true

class FormComponent < ViewComponent::Base
  def initialize(form:)
    @form = form
  end
end
