class DashboardController < ApplicationController
  def show
    @horses = Horse.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
