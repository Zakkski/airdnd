class BookingsController < ApplicationController

  before_action :set_booking, only: [:update, :show, :destroy, :edit]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(create_booking_params)
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking

    if @booking.update(update_booking_params)
      redirect_to event_path(@booking.event.id)
    else
      render 'events/show'
    end
  end

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def update_booking_params
    params.require(:booking).permit(:event_id, :accepted)
  end

  def create_booking_params
    params.permit(:event_id)
  end
end
