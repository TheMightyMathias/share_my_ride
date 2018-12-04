require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all airports"

Airport.all.destroy

puts "Seeding airports worldwide"

json = JSON.parse(File.read('db/airports.json'))
# file = File.join('./db/airports.json')
# data_hash = JSON.parse(file)
# p json

json.each do |airport|
  Airport.create({
    city: airport['city'],
    iata_code: airport['code'],
    name: airport['name'],
    longitude: airport['lon'],
    lattitude: airport['lat'],
    runway_length: airport['runway_length'],
    elev: airport['elev'],
  })
end
