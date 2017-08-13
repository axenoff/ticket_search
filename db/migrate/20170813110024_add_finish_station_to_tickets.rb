class AddFinishStationToTickets < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :finish_station
  end
end
