class UsersController < ApplicationController
  def show
    @user = current_user
    @hosted_events = Event.where(user_id: @user)
    # @booked_events = @user.bookings # this line is for finding all the events a user is booked for
    # @profile = Profile.find(@user)# this is for getting the profile information accessable to the view
  end
end
