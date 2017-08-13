class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets_with_start_station, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :tickets_with_finish_station, class_name: 'Ticket', foreign_key: :finish_station_id
end
