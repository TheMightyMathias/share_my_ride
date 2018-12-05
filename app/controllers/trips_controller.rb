class TripsController < ApplicationController
  def show
    @trips = Trip.find(params[:id])
  end
  def search
    @trips = Trip.all.order('created_at DESC')
    if params[:query][:airport]
      airport_name = params[:query][:airport][0...-5]
      @params = search_params
      # air_id = Airport.where(name: airport_name).ids.join.to_i
      # @trips = Trip.where(airport_id: air_id).order("created_at DESC").where.not(user: current_user)
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
    session[:search] = params[:query]
  end #-> at the end of the action rails will render the template

  def confirmation
    @trip = Trip.find(params["id"])
    # @trips = Trip.where.not(latitude: nil, longitude: nil)
    # @markers = @trips.map do |trip|
    #   {
    #     lng: trip.longitude,
    #     lat: trip.latitude
    #   }
    # end
  end

  def show
  end

  def new
    @trip = Trip.new
    @trip.time = session[:search]["time"]
    @trip.terminal = session[:search]["terminal"]
    airport_name = session[:search]["airport"].split(",")[1].strip
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

  private

  def trip_params
    params.require(:trip).permit(:terminal, :airport_id, :destination, :time, :user_id)
  end

  def search_params
    params.require(:query).permit(:destination, :airport, :terminal, :air_id)
  end

end
