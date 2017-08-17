class AddNumbersOrderToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :numbers_order, :boolean, :default => true

  end
end
