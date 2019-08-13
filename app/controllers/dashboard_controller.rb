class DashboardController < ApplicationController
  def show
    @horses = Horse.where(horse.user == current_user)
  end
end
