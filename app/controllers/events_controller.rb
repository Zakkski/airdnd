class EventsController < ApplicationController
  def show
    @booking = Booking.new
    @event = Event.find(params[:id])
    @profile = @event.user.profile
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def index
    @events = policy_scope(Event).order(created_at: :desc)

  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.user = current_user
    if @event.save
      redirect_to root_path # Needs to redirect to show
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:game, :description, :location,:date, :user)
  end
end
