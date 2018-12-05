class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :terminal
      t.string :destination
      t.float :latitude
      t.float :longitude
      t.datetime :time
      t.references :user, foreign_key: true
      t.integer :ride_mates_limit

      t.timestamps
    end
  end
end
