require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying current DB"

Airport.destroy_all
User.destroy_all
Trip.destroy_all
RideMate.destroy_all

puts "Seeding airports worldwide"

json = JSON.parse(File.read('db/airports.json'))
# file = File.join('./db/airports.json')
# data_hash = JSON.parse(file)

json.each do |airport|
  Airport.create({
    city: airport['city'],
    iata_code: airport['code'],
    name: airport['name'],
    longitude: airport['lon'],
    lattitude: airport['lat'],
    runway_length: airport['runway_length'],
    elev: airport['elev'],
    time_zone: airport['tz'],
  })
end

puts "creating some users"

User.create({
  email: 'ryan@wagon.com',
  password: '123456',
})

User.create({
  email: 'goga@wagon.com',
  password: '123456',
})

User.create({
  email: 'douglas@wagon.com',
  password: '123456',
})

User.create({
  email: 'mathias@wagon.com',
  password: '123456',
})

User.create({
  email: 'gus@wagon.com',
  password: '123456',
})

User.create({
  email: 'daniel@wagon.com',
  password: '123456',
})

User.create({
  email: 'jascha@wagon.com',
  password: '123456',
})

User.create({
  email: 'lamina@wagon.com',
  password: '123456',
})

User.create({
  email: 'xun@wagon.com',
  password: '123456',
})

User.create({
  email: 'annie@wagon.com',
  password: '123456',
})

User.create({
  email: 'ian@wagon.com',
  password: '123456',
})

User.create({
  email: 'lucas@wagon.com',
  password: '123456',
})

User.create({
  email: 'pierre@wagon.com',
  password: '123456',
})

User.create({
  email: 'marco@wagon.com',
  password: '123456',
})
users = User.all
puts "creating trips"

Trip.create!({
  terminal: '2',
  destination: 'Placa de Catalunya',
  lattitude: 41.3870154,
  longitude: 2.1700471000000334,
  time: Time.new(2018,12,14,12,30),
  # date: Date.new(2018,12,14),
  user_id: 1,
  airport_id: Airport.where(iata_code:"BCN").ids.join.to_i,
  ride_mates_limit: 3
})


Trip.create!({
  terminal: '2',
  destination: 'Placa de Catalunya',
  lattitude: 41.3870154,
  longitude: 2.1700471000000334,
  time: Time.new(2018,12,14,12,40),
  # date: Date.new(2018,12,14),
  user_id: 2,
  airport_id: Airport.where(iata_code:"BCN").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '2',
  destination: 'Passeig de Gracia',
  lattitude: 41.39307009999999,
  longitude: 2.163815999999997,
  time: Time.new(2018,12,14,12,50),
  # date: Date.new(2018,12,14),
  user_id: 3,
  airport_id: Airport.where(iata_code:"BCN").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '2',
  destination: 'Passeig de Gracia',
  lattitude: 41.39307009999999,
  longitude: 2.163815999999997,
  time: Time.new(2018,12,14,12,55),
  # date: Date.new(2018,12,14),
  user_id: 4,
  airport_id: Airport.where(iata_code:"BCN").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Arc de Triomphe',
  lattitude: 48.8737793,
  longitude: 2.2950155999999424,
  time: Time.new(2018,12,16,14,30),
  # date: Date.new(2018,12,14),
  user_id: 1,
  airport_id: Airport.where(iata_code:"CDG").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Arc de Triomphe',
  lattitude: 48.8737793,
  longitude: 2.2950155999999424,
  time: Time.new(2018,12,16,14,35),
  # date: Date.new(2018,12,14),
  user_id: 2,
  airport_id: Airport.where(iata_code:"CDG").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Arc de Triomphe',
  lattitude: 48.8737793,
  longitude: 2.2950155999999424,
  time: Time.new(2018,12,16,15,00),
  # date: Date.new(2018,12,14),
  user_id: 3,
  airport_id: Airport.where(iata_code:"CDG").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Tour Eiffel',
  lattitude: 48.85589859999999,
  longitude: 2.298087500000065,
  time: Time.new(2018,12,16,15,05),
  # date: Date.new(2018,12,14),
  user_id: 4,
  airport_id: Airport.where(iata_code:"CDG").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Venice Beach',
  lattitude: 33.9936153,
  longitude: -118.4799099,
  time: Time.new(2018,12,17,12,30),
  # date: Date.new(2018,12,14),
  user_id: 5,
  airport_id: Airport.where(iata_code:"LAX").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Venice Beach',
  lattitude: 33.9936153,
  longitude: -118.4799099,
  time: Time.new(2018,12,17,12,45),
  # date: Date.new(2018,12,14),
  user_id: 6,
  airport_id: Airport.where(iata_code:"LAX").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Universal Studios Hollywood',
  lattitude: 34.13811680000001,
  longitude: -118.35337830000003,
  time: Time.new(2018,12,17,12,30),
  # date: Date.new(2018,12,14),
  user_id: 7,
  airport_id: Airport.where(iata_code:"LAX").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Universal Studios Hollywood',
  lattitude: 34.13811680000001,
  longitude: -118.35337830000003,
  time: Time.new(2018,12,17,13,00),
  # date: Date.new(2018,12,14),
  user_id: 8,
  airport_id: Airport.where(iata_code:"LAX").ids.join.to_i,
  ride_mates_limit: 3
})

puts "12 trips created"

puts "Creating RideMate"

RideMate.create({
  user_id: 8,
  trip_id: 1,
})

RideMate.create({
  user_id: 9,
  trip_id: 1,
})

RideMate.create({
  user_id: 10,
  trip_id: 2,
})

RideMate.create({
  user_id: 11,
  trip_id: 3,
})

RideMate.create({
  user_id: 12,
  trip_id: 3,
})

RideMate.create({
  user_id: 13,
  trip_id: 4,
})

RideMate.create({
  user_id: 7,
  trip_id: 5,
})

RideMate.create({
  user_id: 8,
  trip_id: 6,
})
