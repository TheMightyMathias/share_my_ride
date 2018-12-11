class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :trips]

  def all
    @trips = Trip.all
  end

  def show
    @user_trips = current_user.trips
    @ridemate_trips = current_user.ridemate_trips
  end

  def trips
    @trips = user.trips
  end


  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :photo, :email)
  end
end
