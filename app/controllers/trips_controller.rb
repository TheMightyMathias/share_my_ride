class TripsController < ApplicationController
  def search
    if params[:query]
      airport_name = params[:query][:airport][0...-5]
      air_id = Airport.where(name:airport_name).ids.join.to_i
      @trips = Trip.where(airport_id:air_id).order("created_at DESC").where.not(user: current_user)
      @params = search_params
    else
      @trips = Trip.all.order('created_at DESC')
    end


      @markers = @trips.map do |trip|
        {
          lng: trip.longitude,
          lat: trip.latitude
        }
      end
  end

  def confirmation
    @trips = Trip.where.not(latitude: nil, longitude: nil)
    @markers = @trips.map do |trip|
      {
        lng: trip.longitude,
        lat: trip.latitude
      }
    end
  end

  def show
  end

  def new
    @trip = Trip.new
    # @trip.time = Time.now
  end

  private

  def search_params
    params.require(:query).permit(:destination, :airport, :terminal, :air_id)
  end
end
