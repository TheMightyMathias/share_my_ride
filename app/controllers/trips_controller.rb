class TripsController < ApplicationController
  def all
    @trips = Trip.all
  end

  def show
    @trips = Trip.find(params[:id])
  end

  def search
    @trips = Trip.all.order('created_at DESC')
    if params[:query][:airport]
      airport_name = params[:query][:airport][0...-5]
      @params = search_params
      @trips = Trip.joins(:airport).where("airports.name @@ '%#{airport_name}%'").order("created_at DESC").where.not(user: current_user)
    end
    if params[:query][:terminal] && params[:query][:airport]
      @trips = @trips.where("terminal @@ '#{params[:query][:terminal]}'")
    end
    # @terminals = @trips.map { |trip| trip.terminal }
    @markers = @trips.map do |trip|
      {
        lng: trip.longitude,
        lat: trip.latitude
      }
    end

    session[:user_coordinates] = Geocoder.search(params[:query]["destination"]).first.coordinates
    destination_marker = {
      lng: session[:user_coordinates][1],
      lat: session[:user_coordinates][0]
    }
    session[:search] = params[:query]
  end

  def confirmation
    @trip = Trip.find(params["id"])
    @ridemates = @trip.ridemates
    @mates = @trip.trip_users
    @markers = []
    trip_marker = {
      lng: @trip.longitude,
      lat: @trip.latitude
    }
    @markers << trip_marker

    @total_estimate = (@trip.estimate / (@mates.count + 1)).round(2)

    @user_marker = {
      lng: session[:user_coordinates][1],
      lat: session[:user_coordinates][0]
    }
    @markers << @user_marker
  end

  def show
    @trip = Trip.find(params["id"])
    @ridemates = @trip.ridemates
    @mates = @trip.trip_users
    @markers = []
    trip_marker = {
      lng: @trip.longitude,
      lat: @trip.latitude
    }
    @markers << trip_marker

    @total_estimate = (@trip.estimate / (@mates.count + 1)).round(2)

    @user_marker = {
      lng: session[:user_coordinates][1],
      lat: session[:user_coordinates][0]
    }
    @markers << @user_marker
  end

  def new
    @trip = Trip.new
    @trip.time = session[:search]["time"]
    @trip.terminal = session[:search]["terminal"]
    airport_name = session[:search]["airport"].split(",")[1].strip.upcase
    @trip.airport_id = Airport.find_by(iata_code:airport_name).id
    @trip.destination = session[:search]["destination"]
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.airport_id = Airport.where(name:params["trip"]["airport"]).ids.join.to_i
    @trip.save
    redirect_to confirmation_path(@trip)
  end

  def chat
    @trip = Trip.includes(messages: :user).find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:terminal, :airport_id, :destination, :time, :user_id, :estimate)
  end

  def search_params
    params.require(:query).permit(:destination, :airport, :terminal, :air_id, :longitude, :latitude)
  end
end
