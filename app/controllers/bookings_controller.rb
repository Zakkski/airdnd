class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :show]
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to event_path(@event)
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
