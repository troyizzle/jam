class ApplicationController < ActionController::Base
  DEFAULT_THEME = 'dark'.freeze
  before_action :set_theme

  private

  def after_inactive_sign_up_path_for(_resource)
    new_profile_path
  end

  def set_theme
    return if cookies[:theme]

    cookies[:theme] = {
      value: DEFAULT_THEME
    }
  end
end
