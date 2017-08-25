class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_order_number, :update_arrival_time, :update_departure_time]
  before_action :set_route, only: [:update_order_time, :update_arrival_time, :update_departure_time]


  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully created.' }
        format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully updated.' }
        format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_order_number
    @route = Route.find(params[:route_id])
    @railway_station.update_order_number(@route, params[:order_number])
    redirect_to @route
  end

  def update_arrival_time
    @route = Route.find(params[:route_id])
    @railway_station.update_arrival_time(@route, params[:arrival_time])
    redirect_to @route
  end

  def update_departure_time
    @route = Route.find(params[:route_id])
    @railway_station.update_departure_time(@route, params[:departure_time])
    redirect_to @route
  end

  private
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def set_route
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
