class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @booking = Booking.new
    @event = Event.find(params[:id])
    @bookings = @event.bookings
    @profile = @event.user.profile
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
    @games = ["Magic The Gathering",
             "Dungeons and Dragons",
             "Warhammer 40K",
             "Risk",
             "World of Darkness",
             "Settlers of Catan",
             "Cards Against Humanity",
             "Group Board Game",
             "Modern Game",
             "Fantasy Game"]
  end

  def index
    if params[:query] == "nearby"
      if current_user
        @events = policy_scope(Event).near(current_user.profile.lat_long, 15) if current_user.profile.lat_long
      else
        flash.now[:notice] = "please log in to search nearby"
        @events = policy_scope(Event).order(created_at: :desc)
      end
    elsif params[:query].present?
      @events = policy_scope(Event).search_by_game_and_description(params[:query])
    else
      @events = policy_scope(Event).order(created_at: :desc)
    end

    # @markers = @events.map do |event|
    #   {
    #     lat: event.latitude,
    #     lng: event.longitude,
    #     infoWindow: render_to_string(partial: "infowindow", locals: { event: event })
    #   }
    # end
  end

  def my_events
    @events = policy_scope(Event).where(user: current_user)
  end

  def create
    img_array = ["wh40k_siuqno","stone_gszij2", "beast_q1zm9g", "green_nhtvia", "snow_u7avxm", "drag_fsgr1q", "rock_wnbh0s",
                 "spider_ueutid", "sea_iweyjv", "sea2_g9fu1p", "power_lzg5by", "drag2_mll4uf",
                 "drag3_ewgrag", "demon_qvpjzt", "horror_ayjvoq", "40k2_rhr1zd"]
    @event = Event.new(event_params)
    authorize @event
    @event.photo = img_array.sample
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event) # Needs to redirect to show
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    if @event.update(event_params)
      redirect_to @event
    else
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event

    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:game, :description, :location,:date, :user)
  end
end
