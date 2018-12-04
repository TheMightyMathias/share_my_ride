class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :terminal
      t.string :destination
      t.float :destination_lattitude
      t.float :destination_longitude
      t.time :time
      t.date :date
      t.references :user, foreign_key: true
      t.integer :ride_mates_limit

      t.timestamps
    end
  end
end
