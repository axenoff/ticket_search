class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets_with_start_station, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :tickets_with_finish_station, class_name: 'Ticket', foreign_key: :finish_station_id

  scope :ordered, -> {joins(:railway_stations_routes).order("railway_stations_routes.order_number").uniq}

  def find_route(route)
    @route = RailwayStationsRoute.where(route_id: route.id, railway_station_id: self.id).first
  end

  def order_number(route)
    @order_number = RailwayStationsRoute.where(route_id: route.id, railway_station_id: self.id).first.order_number
  end

  def update_order_number(route, order_number)
    #station_route(route)
    station_route = station_route(route)
    station_route.update(order_number: order_number) if station_route
  end

  def number_in(route)
    #station_route(route)
    station_route(route).try(:order_number)
  end

  def update_arrival_time(route, arrival_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time) if station_route
  end

  def update_departure_time(route, departure_time)
    station_route = station_route(route)
    station_route.update(departure_time: departure_time) if station_route
  end

  def arrival_time(route)
    station_route(route).try(:arrival_time)
  end

  def departure_time(route)
    station_route(route).try(:departure_time)
  end

  protected
  def station_route(route)
    @station_route||= railway_stations_routes.where(route: route).first
  end
end
