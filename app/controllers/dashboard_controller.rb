class DashboardController < ApplicationController
  def show
    @horses = Horse.where(user: current_user)
    @booking = Booking.where(user: current_user)
  end
end
