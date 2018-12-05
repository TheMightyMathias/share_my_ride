class RidematesController < ApplicationController
  def create

    @trip = Trip.find(params[:trip_id])
    @ridemate = Ridemate.new
    @ridemate.trip_id = params["trip_id"]
    @ridemate.user = current_user
    if @ridemate.save
      redirect_to confirmation_path(@ridemate)
    else
      render "trips/show"
    end
  end
end
