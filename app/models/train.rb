class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets, foreign_key: :start_station_id
  has_many :tickets, foreign_key: :finish_station_id
end
