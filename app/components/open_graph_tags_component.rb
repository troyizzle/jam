# frozen_string_literal: true

class OpenGraphTagsComponent < ViewComponent::Base
  def initialize(title: nil, description: nil, image: nil, url: nil)
    @title = title
    @description = description
    @image = image
    @url = url
  end

  def description
    @description || 'Jam'
  end

  def title
    @title || 'Jam'
  end

  def url
    root_url
  end

  attr_reader :image
end
