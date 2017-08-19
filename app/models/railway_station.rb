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
    station_route = railway_stations_routes.where(route: route).first
    station_route.update(order_number: order_number) if station_route
  end

  def number_in(route)
    station_route = railway_stations_routes.where(route: route).first
    station_route.try(:order_number)
  end
end
