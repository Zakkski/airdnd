class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @profile = @event.user.profile
  end

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
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
