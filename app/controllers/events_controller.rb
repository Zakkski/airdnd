class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @profile = Profile.find(@event.user.id)
  end

  def new
    @event = Event.new
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
    params.require(:event).permit(:game, :description, :location, :user)
  end
end
