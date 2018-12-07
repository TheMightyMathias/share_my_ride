class Addcolumnstoridemate < ActiveRecord::Migration[5.2]
  def change
    add_column :ridemates, :destination, :string
    add_column :ridemates, :latitude, :float
    add_column :ridemates, :longitude, :float
  end
end
