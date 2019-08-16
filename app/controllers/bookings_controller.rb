class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :confirm_booking, :reject_booking]

  def index
    @bookings = Booking.all
  end

  def show
    horse = @booking.horse
    @markers = [{ lat: horse.latitude, lng: horse.longitude }]
  end

  def create
    @horse = Horse.find(params[:horse_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.horse = @horse
    @booking.total_price = @horse.price * (@booking.end_date - @booking.start_date)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render template: 'horses/show'
    end
  end

  # def edit
  # end

  def confirm_booking
    if @booking.status == "pending"
      if params[:status] == "accept"
        @booking.status = "Accepted"
      elsif params[:status] == "reject"
        @booking.status = "Rejected"
      end
      @booking.save
    end
    redirect_to dashboard_path
  end

  def reject_booking
    @booking.status = "rejected"
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def status
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
