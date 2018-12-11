class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :trips]

  def all
    @trips = Trip.all
  end

  def show

    # @ridemates = Ridemate.all

    set_user
    # @trips = current_user.trips
    # @trips = @trips.where(user: current_user)
    @trips = Trip.all
    # @trips = @trip.select do |trip|
    #   trip.trip_users.include?(set_user)
    # end
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
