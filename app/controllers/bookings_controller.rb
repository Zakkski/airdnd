class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :show]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to event_path(@booking.event)
    else
      render 'events/show'
    end
  end

  def index
    @bookings = current_user.bookings
  end



  private

  def set_booking
    @booking = Booking.Find(params[:id])
  end

  def booking_params
    params.permit(:event_id)
  end
end
