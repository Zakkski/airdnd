class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    @user = current_user
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)

    authorize @profile
    @profile.user = current_user

    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :photo, :photo_cache)
  end
end
