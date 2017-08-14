class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.integer :train
      t.string :type_of_wagon
      t.integer :bottom_seats
      t.integer :top_seats

      t.timestamps
    end

    add_belongs_to :wagons, :train
  end
end
