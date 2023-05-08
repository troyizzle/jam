# frozen_string_literal: true
class SettingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
    @betting_books = BettingBook.with_user_books(current_user).enabled_first
  end
end
