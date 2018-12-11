class RidematesController < ApplicationController
  # after_create :send_trip_confirm

  def create
    @trip = Trip.find(params[:trip_id])
    @ridemate = Ridemate.new
    @ridemate.trip = @trip
    @ridemate.user = current_user
    destination_coordinates = Geocoder.search(session[:search]["destination"]).first.coordinates
    @ridemate.destination = session[:search]["destination"]
    @ridemate.longitude = destination_coordinates[1]
    @ridemate.latitude = destination_coordinates[0]
    if @ridemate.save

      redirect_to confirmation_path(@trip.id)
    else
      flash[:alert] = "You are already on this trip buddy."
      redirect_to request.referer
    end
  end

  # private
  # def send_trip_confirm
  #   UserMailer.tripconfirm(self).deliver_now
  # end
end
