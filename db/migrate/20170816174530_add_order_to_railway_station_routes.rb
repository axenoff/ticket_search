class AddOrderToRailwayStationRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :order_number, :integer
  end
end
