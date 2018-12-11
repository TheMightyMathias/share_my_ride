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
Ridemate.destroy_all

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
    latitude: airport['lat'],
    runway_length: airport['runway_length'],
    elev: airport['elev'],
    time_zone: airport['tz'],
  })
end



puts "creating Users"
#1
User.create({
  email: 'mathias@wagon.com',
  password: '123456',
  first_name: 'Mathias',
  last_name: 'Sellam',
  username: 'MathS',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/38690859.jpg',
})

User.create({
  email: 'douglas@wagon.com',
  password: '123456',
  first_name: 'Douglas',
  last_name: 'Bay',
  username: 'The Doug',
  remote_photo_url: "https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183072/43327471.png",
})

User.create({
  email: 'gollum@wagon.com',
  password: '123456',
  first_name: 'Gollum',
  last_name: 'Smeagol',
  username: 'Whereismyprecious?',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544184291/0_yt7Mwvdb8e08xxhk.jpg',
})

User.create({
  email: 'alan@wagon.com',
  password: '123456',
  first_name: 'Alan',
  last_name: 'Keegan',
  username: 'Alan.Keegan',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183072/41964244.jpg'
})

User.create({
  email: 'ian@wagon.com',
  password: '123456',
  first_name: 'Ian',
  last_name: 'Hunter',
  username: 'Ian The Hunter',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183072/44059754.jpg'
})

User.create({
  email: 'jascha@wagon.com',
  password: '123456',
  first_name: 'Jascha',
  last_name: 'Drel',
  username: 'The Flying Dutchman',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183071/42733581.png'
})




#2
User.create({
  email: 'julia@wagon.com',
  password: '123456',
  first_name: 'Julia',
  last_name: 'Cocco',
  username: 'J.Cocco',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183070/42177265.jpg',
})

User.create({
  email: 'lucas@wagon.com',
  password: '123456',
  first_name: 'Lucas',
  last_name: 'Rocha',
  username: 'Lucas Da Rocha',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183070/42940098.jpg',
})

User.create({
  email: 'donald@wagon.com',
  password: '123456',
  first_name: 'Donlad',
  last_name: 'Trump',
  username: 'Donald J Trump',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544184292/9026192-3x2-700x467.jpg',
})

User.create({
  email: '@wagon.com',
  password: '123456',
  first_name: 'Lamina',
  last_name: 'Vedder',
  username: 'LaminaV',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183070/42808135.jpg',
})

User.create({
  email: 'Pierre@wagon.com',
  password: '123456',
  first_name: 'Pierre',
  last_name: 'Hervé Basin',
  username: 'PHB',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/42039881.png',
})

User.create({
  email: 'alfonso@wagon.com',
  password: '123456',
  first_name: 'Alfonso',
  last_name: 'Garcia De Corral',
  username: 'Xx_Al_GDC_xX',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/35847472.png',
})


#3
User.create({
  email: 'mathias@wagon.com',
  password: '123456',
  first_name: 'Mathias',
  last_name: 'Sellam',
  username: 'TheMightyMathias',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/38690859.jpg',
})

User.create({
  email: 'xun@wagon.com',
  password: '123456',
  first_name: 'Xun',
  last_name: 'Ma',
  username: 'XunXunXun',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/43337020.jpg',
})

User.create({
  email: 'drevil@wagon.com',
  password: '123456',
  first_name: 'Dr',
  last_name: 'Evil',
  username: 'DrEvil1998',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/200px-Drevil_million_dollars.jpg',
})


User.create({
  email: 'marina@wagon.com',
  password: '123456',
  first_name: 'Marina',
  last_name: 'Kjaer',
  username: 'MarinaK',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/38080513.png',
})

User.create({
  email: 'annie@wagon.com',
  password: '123456',
  first_name: 'Annie',
  last_name: 'Gilchrist',
  username: 'Annie G (not ali G)',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/42188961.png',
})

User.create({
  email: 'daniel@wagon.com',
  password: '123456',
  first_name: 'Daniel',
  last_name: 'Mera De Agustin',
  username: 'Para Justicia',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/11755954.jpg',
})

#4
User.create({
  email: 'sergi@wagon.com',
  password: '123456',
  first_name: 'Sergi',
  last_name: 'Campos',
  username: 'El Catalan',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/43750993.jpg',
})

User.create({
  email: 'vianney@wagon.com',
  password: '123456',
  first_name: 'Vianney',
  last_name: 'De Boisredon',
  username: 'VDB',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/43636442.jpg'
})

User.create({
  email: 'borat@wagon.com',
  password: '123456',
  first_name: 'Borat',
  last_name: 'Ehh',
  username: 'Borat',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/Ado4FXGS_400x400.jpg',
})

User.create({
  email: 'ryan@wagon.com',
  password: '123456',
  first_name: 'Ryan',
  last_name: 'Propst',
  username: 'RyanP',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544177778/j6grr6cqji4zinekpsuo.jpg'
})

User.create({
  email: 'goga@wagon.com',
  password: '123456',
  first_name: 'Goga',
  last_name: 'Hayrapetyan',
  username: 'Goga2004',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544180827/ckmeirbpmnqj8mv0xvxv.jpg',
})

User.create({
  email: 'marco@wagon.com',
  password: '123456',
  first_name: 'Marco',
  last_name: 'Monti',
  username: 'Sutton4Ever',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544184500/43962897.jpg',
})




puts "creating trips"

#Bali Trips
Trip.create!({
  terminal: '1',
  destination: 'Four Season Bali',
  latitude: -8.500776199999999,
  longitude: 115.24154120000003,
  time: Time.new(2018,12,8,12,30),
  estimate: 8.14,
  # date: Date.new(2018,12,14),
  user_id: 1,
  airport_id: Airport.where(iata_code:"DPS").ids.join.to_i,
  estimate: 20,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Kubu, Bangli Sub-District',
  latitude: -8.4303071,
  longitude: 115.36375929999997,
  time: Time.new(2018,12,8,12,40),
  estimate: 14.14,
  # date: Date.new(2018,12,14),
  user_id: 2,
  airport_id: Airport.where(iata_code:"DPS").ids.join.to_i,
  estimate: 22,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Bali Volcano',
  latitude: -8.224417899999997,
  longitude: 115.39595129999998,
  time: Time.new(2018,12,8,12,50),
  estimate: 120.14,
  # date: Date.new(2018,12,14),
  user_id: 3,
  airport_id: Airport.where(iata_code:"DPS").ids.join.to_i,
  estimate: 30,
  ride_mates_limit: 3
})

#Melbourne Trip

Trip.create!({
  terminal: '1',
  destination: 'Cup Of Truth café',
  latitude: -37.8177625,
  longitude: 144.96598829999994,
  time: Time.new(2018,12,8,12,50),
  estimate: 8.14,
  # date: Date.new(2018,12,14),
  user_id: 7,
  airport_id: Airport.where(iata_code:"MLB").ids.join.to_i,
  estimate: 45,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Royal Botanic Gardens',
  latitude: -37.829865,
  longitude: 144.97529580000003,
  time: Time.new(2018,12,8,13,50),
  estimate: 87.14,
  # date: Date.new(2018,12,14),
  user_id: 8,
  airport_id: Airport.where(iata_code:"MLB").ids.join.to_i,
  estimate: 50,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Melbourne Showground',
  latitude: -37.7802949,
  longitude: 144.91482559999997,
  time: Time.new(2018,12,8,13,10),
  estimate: 90.14,
  # date: Date.new(2018,12,14),
  user_id: 9,
  airport_id: Airport.where(iata_code:"MLB").ids.join.to_i,
  estimate: 40,
  ride_mates_limit: 3
})

# Panama

Trip.create!({
  terminal: '1',
  destination: 'Technological University of Panama',
  latitude: 9.0238187,
  longitude: -79.53153980000002,
  time: Time.new(2018,12,8,12,50),
  estimate: 78.14,
  # date: Date.new(2018,12,14),
  user_id: 13,
  airport_id: Airport.where(iata_code:"PTY").ids.join.to_i,
  estimate: 35,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Recreational Park Omar Torrijos',
  latitude: 8.9973491,
  longitude: -79.5076396,
  time: Time.new(2018,12,8,13,50),
  estimate: 45.78,
  # date: Date.new(2018,12,14),
  user_id: 14,
  airport_id: Airport.where(iata_code:"PTY").ids.join.to_i,
  estimate: 30,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Vía Cincuentenario',
  latitude: 9.006719230352909,
  longitude: -79.48526859283447,
  time: Time.new(2018,12,8,13,30),
  estimate: 99.10,
  # date: Date.new(2018,12,14),
  user_id: 15,
  airport_id: Airport.where(iata_code:"PTY").ids.join.to_i,
  estimate: 28,
  ride_mates_limit: 3
})


#Paris

Trip.create!({
  terminal: '1',
  destination: 'Arc de Triomphe',
  latitude: 48.8737917,
  longitude: 2.29502750000006,
  time: Time.new(2018,12,8,12,30),
  estimate: 89.14,
  # date: Date.new(2018,12,14),
  user_id: 19,
  airport_id: Airport.where(iata_code:"CDG").ids.join.to_i,
  estimate: 40,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Sacré-Cœur',
  latitude: 48.88670459999999,
  longitude: 2.34310430000005,
  time: Time.new(2018,12,8,12,50),
  estimate: 34.14,
  # date: Date.new(2018,12,14),
  user_id: 20,
  airport_id: Airport.where(iata_code:"CDG").ids.join.to_i,
  estimate: 40,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Louvre Museum',
  latitude: 48.8606111,
  longitude: 2.3376439999999548,
  time: Time.new(2018,12,8,12,40),
  estimate: 12.14,
  # date: Date.new(2018,12,14),
  user_id: 21,
  airport_id: Airport.where(iata_code:"CDG").ids.join.to_i,
  estimate: 40,
  ride_mates_limit: 3
})

puts "12 trips created"

puts "Creating RideMate"

Ridemate.create({
  user_id: 4,
  trip_id: 1,
})

Ridemate.create({
  user_id: 5,
  trip_id: 1,
})

Ridemate.create({
  user_id: 6,
  trip_id: 2,
})

Ridemate.create({
  user_id: 10,
  trip_id: 4,
})

Ridemate.create({
  user_id: 11,
  trip_id: 4,
})

Ridemate.create({
  user_id: 12,
  trip_id: 5,
})

Ridemate.create({
  user_id: 16,
  trip_id: 7,
})

Ridemate.create({
  user_id: 17,
  trip_id: 7,
})

Ridemate.create({
  user_id: 18,
  trip_id: 8,
})


Ridemate.create({
  user_id: 22,
  trip_id: 10,
})

Ridemate.create({
  user_id: 23,
  trip_id: 10,
})

Ridemate.create({
  user_id: 24,
  trip_id: 11,
})

