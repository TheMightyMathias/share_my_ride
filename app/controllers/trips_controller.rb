class TripsController < ApplicationController
  def search_results
    if params[:query]
      sql_query = "destination ILIKE :query"
      @trips = Trip.where(sql_query, query: "%#{params[:query][:destination]}%").order("created_at DESC").where.not(user: current_user)
      @params = search_params
    else
      @trips = Trip.all.order('created_at DESC')
    end
  end
end
