class AddTypeToWagons < ActiveRecord::Migration[5.0]
  def change
    remove_column :wagons, :type_of_wagon
    add_column :wagons, :type, :string
    add_column :wagons, :side_bottom_seats, :integer
    add_column :wagons, :side_top_seats, :integer
    add_column :wagons, :sitting_places, :integer
    add_column :wagons, :number, :integer
  end
end
