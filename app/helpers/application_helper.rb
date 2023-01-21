module ApplicationHelper
  def html_classes
    "#{cookies[:theme]} h-full"
  end
end
