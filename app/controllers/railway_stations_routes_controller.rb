class RailwayStationsRoutesController < ApplicationController
  before_action :set_railway_stations_route, only: [:edit, :update]


  def edit
  end

  def update
    if @railway_stations_route.update(railway_stations_route_params)
      redirect_to @railway_stations_route.route
    else 
      render :edit
    end
  end

  private
  def set_railway_stations_route
    @railway_stations_route = RailwayStationsRoute.find(params[:id])
  end

  def railway_stations_route_params
    params.require(:railway_stations_route).permit(:railway_station_id, :order_number)
  end
end
