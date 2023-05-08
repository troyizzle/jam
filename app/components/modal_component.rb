# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :body

  def initialize(title:)
    @title = title
  end

  def render_title?
    @title.present?
  end
end
