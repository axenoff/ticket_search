class Route < ApplicationRecord
  validates :name, presence: true
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains 

  def self.search(start_station_id, finish_station_id)
    @result = []
    @preresult = []
    start_routes = Route.joins(:railway_stations).where(:railway_stations => {:id => start_station_id})
    start_routes = start_routes.map {|i| i.id}
    finish_routes = Route.joins(:railway_stations).where(:railway_stations => {:id => finish_station_id})
    finish_routes = finish_routes.map {|i| i.id}
    @result = start_routes & finish_routes
    if @result.present?
      @result.each do |route_id|
        start_station = Route.find(route_id).railway_stations.find(start_station_id)
        finish_station = Route.find(route_id).railway_stations.find(finish_station_id)
        @result.delete(route_id) if start_station.order_number(Route.find(route_id)).to_i >= finish_station.order_number(Route.find(route_id)).to_i
      end
    end
  end

  def self.show_result_params(start_station_id, finish_station_id)
    self.search(start_station_id, finish_station_id)
    @params = []
    @result.each do |route_id|
      Route.find(route_id).trains.each do |train|
        departure_time = train.route.railway_stations.find(start_station_id).departure_time(Route.find(route_id)).to_s
        arrival_time = train.route.railway_stations.find(finish_station_id).arrival_time(Route.find(route_id)).to_s
        @params << [train.number, departure_time, arrival_time]
      end
    end
    @params
  end
end
