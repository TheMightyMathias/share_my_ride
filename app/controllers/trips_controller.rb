class TripsController < ApplicationController
  before_action :set_trip, only: [:destroy]

  def all
    @trips = Trip.all
  end

  def show
    @trips = Trip.find(params[:id])
  end

  def search
    @trips = Trip.all.order('created_at DESC')
    @airports = Airport.all
    @airports = @airports.map do |airport|
      airport.name
    end
    if @airports.include?(params[:query][:airport][0...-5].titleize) || @airports.include?(params[:query][:airport][0...-5])
      airport_name = params[:query][:airport][0...-5]
      @params = search_params
      @trips = Trip.joins(:airport).where("airports.name @@ '%#{airport_name}%'").order("time ASC")
                   .where.not(user: current_user)
    else
      flash[:alert] = "You need to select a valid airport from the list, buddy."
      redirect_to request.referer
    end

    if params[:query][:terminal] && params[:query][:airport]
      @trips = @trips.where("terminal @@ '#{params[:query][:terminal]}'")
    end

    @trips = @trips.select do |trip|
      trip.ride_mates_limit > trip.ridemates.count
    end

    @trips = @trips.select do |trip|
      trip.trip_users.exclude?(current_user)
    end

    @trips = @trips.select do |trip|
      Time.parse(params[:query][:time]) + (60 * 60 * 24) > trip.time
    end

    @trips = @trips.select do |trip|
      trip.time > Time.parse(params[:query][:time])
    end

    @markers = @trips.map do |trip|
      {
        lng: trip.longitude,
        lat: trip.latitude,
        infoWindow: { content: render_to_string(partial: "shared/map_window", locals: { trip: trip }) },
      }
    end

    if Geocoder.search(params[:query]["destination"]).first

      session[:user_coordinates] = Geocoder.search(params[:query]["destination"]).first.coordinates

      destination_marker = {
        lng: session[:user_coordinates][1],
        lat: session[:user_coordinates][0]
      }

      @markers << destination_marker

    else
      @message = "Your destination has no matching rides, below are all trips leaving from your airport"
    end

    session[:search] = params[:query]
  end

  def confirmation
    @trip = Trip.find(params["id"])
    @ridemates = @trip.ridemates
    @ridemate = @ridemates.find_by(user: current_user)
    @mates = @trip.trip_users
    @uber_message = session[:uber_message]
    if @uber_message && @uber_message.include?("UBER")
      @request_button = true
    end

    @markers = []
    trip_marker = {
      lng: @trip.longitude,
      lat: @trip.latitude
    }
    @markers << trip_marker
    @total_estimate = (@trip.estimate / (@mates.count + 1)).round(2)
    user_markers_confirmed
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

    @total_estimate = (@trip.estimate / (@mates.count + 2)).round(2)

    user_markers
  end

  def new
    @trip = Trip.new
    @trip.time = session[:search]["time"]
    @trip.terminal = session[:search]["terminal"]
    airport_name = session[:search]["airport"].split(",")[1].strip.upcase
    @trip.airport_id = Airport.find_by(iata_code: airport_name).id
    @trip.destination = session[:search]["destination"]
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    # link the object, dont use ids directly
    # @trip.airport_id = Airport.where(name: params["trip"]["airport"]).ids.join.to_i
    @airport = Airport.find_by(name: params["trip"]["airport"])
    @trip.airport = @airport
    @trip.geocode
    # raise
    if params['trip']['estimate'].present?
      @trip.estimate = params['trip']['estimate']
      session[:uber_message] = "Estimate provided manually by USER"
    else
      client = Uber::Client.new do |config|
        config.server_token = ENV["UBER_SERVER_KEY"]
      end
      estimation = client.price_estimations(
        start_latitude: @airport.latitude,
        start_longitude: @airport.longitude,
        end_latitude: @trip.latitude,
        end_longitude: @trip.longitude
      )[0] # get the first price object out of the array.
      if estimation
        @price_average = (estimation.low_estimate + estimation.high_estimate) / 2
        @trip.estimate = @price_average
        session[:uber_message] = "Estimate provided by UBER"
      end
    end
    # if the uber api returns nothing then we could manually set a estimate
    if @trip.save
      redirect_to confirmation_path(@trip)
    else
      render :new
    end
  end

  def chat
    @trip = Trip.includes(messages: :user).find(params[:id])
  end

  def destroy

    @trip.ridemates.destroy
    @trip.destroy
    redirect_to profiles_path
  end

  def review
    set_trip
    @mates = @trip.trip_users
    @mates = @mates.select do |mate|
      mate != current_user
    end
    @reviews = []
    if @trip.user != current_user
      @reviews << Review.new(reviewed_id: @trip.user.id, reviewer_id: current_user.id)
    end
    @mates.each do |mate|
      @reviews << Review.new(reviewed_id: mate.id, reviewer_id: current_user.id)
    end
    @reviews.each do |review|
      review.trip = @trip
    end
  end

  private

  def trip_markers
    @markers = @trips.map do |trip|
      {
        lng: trip.longitude,
        lat: trip.latitude
      }
    end
  end

  def user_markers
    if session[:search]["destination"] != "";
      destination_marker = {
        lng: session[:user_coordinates][1],
        lat: session[:user_coordinates][0]
      }
      @markers << destination_marker
    end
  end

  def user_markers_confirmed
    if current_user == @trip.user
      @user_marker = {
        lng: @trip.longitude,
        lat: @trip.latitude,
      }
    else
      @destination = Ridemate.where(trip: @trip).where(user: current_user)
      @user_marker = {
        lng: @destination.first.longitude,
        lat: @destination.first.latitude,
      }
    end
    @markers << @user_marker
  end

  def trip_params
    params.require(:trip).permit(:terminal, :airport_id, :destination, :time, :user_id, :estimate, :ride_mates_limit)
  end

  def search_params
    params.require(:query).permit(:destination, :airport, :terminal, :air_id, :longitude, :latitude)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
