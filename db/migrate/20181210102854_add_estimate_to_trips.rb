class AddEstimateToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :estimate, :float
  end
end
