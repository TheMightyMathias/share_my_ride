class RidematesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @ridemate = Ridemate.new
    @ridemate.trip = @trip
    @ridemate.user = current_user
    if @ridemate.save
      redirect_to confirmation_path(@trip.id)
    else
      flash[:alert] = "You are already on this trip buddy."
      redirect_to request.referer
    end
  end
end
