class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @bets = current_user.bets
  end
end
