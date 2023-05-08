# frozen_string_literal: true
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @bet_stats = Analytics::BetService.new(current_user).call
  end
end
