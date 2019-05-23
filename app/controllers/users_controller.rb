class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @hosted_events = Event.where(user_id: @user)
    @profile = @user.profile
    # @booked_events = @user.bookings # this line is for finding all the events a user is booked for
  end
end
