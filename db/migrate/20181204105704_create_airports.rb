class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :city
      t.string :name
      t.string :iata_code
      t.float :longitude
      t.float :lattitude
      t.integer :elev
      t.integer :runway_length

      t.timestamps
    end
  end
end
