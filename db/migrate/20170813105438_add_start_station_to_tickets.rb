class AddStartStationToTickets < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :start_station
  end
end
