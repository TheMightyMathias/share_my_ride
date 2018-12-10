class RidematesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @ridemate = Ridemate.new
    @ridemate.trip_id = params["trip_id"]
    @ridemate.user = current_user
    destination_coordinates = Geocoder.search(session[:search]["destination"]).first.coordinates
    @ridemate.destination = session[:search]["destination"]
    @ridemate.longitude = destination_coordinates[1]
    @ridemate.latitude = destination_coordinates[0]
    if @ridemate.save
      redirect_to confirmation_path(@trip.id)
    else
      render "trips/show"
    end
  end
end
