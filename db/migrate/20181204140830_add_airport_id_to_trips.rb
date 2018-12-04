class AddAirportIdToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :airport_id, :integer
  end
end
