# frozen_string_literal: true

module Analytics
  class BetService
    def initialize(user)
      @user = user
      @bets = @user.bets.won
    end

    def call
      {
        total: "$#{@bets.sum(:won)}",
        percentage: calculate_percentage,
      }
    end

    private

    def calculate_percentage
      return 0 if previous_number.zero?

      difference = current_number - previous_number
      ((difference.to_f / previous_number) * 100).round(1)
    end

    def previous_number
      @bets.finished_between(Time.zone.now.beginning_of_week - 1.week, Time.zone.now.end_of_week - 1.week).sum(:won)
    end

    def current_number
      @bets.finished_between(Time.zone.now.beginning_of_week, Time.zone.now.end_of_week).sum(:won)
    end
  end
end
