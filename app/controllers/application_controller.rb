class ApplicationController < ActionController::Base
  before_action :set_theme

  private

  def set_theme
    return if cookies[:theme]

    cookies[:theme] = 'dark'
  end
end
