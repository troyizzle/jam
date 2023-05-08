# frozen_string_literal: true
module ApplicationHelper
  include OpenGraphTagsHelper
  def html_classes
    "#{cookies[:theme]} h-full"
  end

  def stylesheet_link_tags
    stylesheets = %w[application]

    stylesheet_link_tag(*stylesheets, media: 'all', "data-turbo-track": 'reload')
  end
end
