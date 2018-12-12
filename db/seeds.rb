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
  email: 'mathias@sharemyride.tech',
  password: '123456',
  first_name: 'Mathias',
  last_name: 'Sellam',
  username: 'MathS',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/38690859.jpg',
})

User.create({
  email: 'douglas@sharemyride.tech',
  password: '123456',
  first_name: 'Douglas',
  last_name: 'Bay',
  username: 'The Doug',
  remote_photo_url: "https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183072/43327471.png",
})

User.create({
  email: 'gollum@sharemyride.tech',
  password: '123456',
  first_name: 'Gollum',
  last_name: 'Smeagol',
  username: 'Whereismyprecious?',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544184291/0_yt7Mwvdb8e08xxhk.jpg',
})

User.create({
  email: 'alan@sharemyride.tech',
  password: '123456',
  first_name: 'Alan',
  last_name: 'Keegan',
  username: 'Alan.Keegan',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183072/41964244.jpg'
})

User.create({
  email: 'ian@sharemyride.tech',
  password: '123456',
  first_name: 'Ian',
  last_name: 'Hunter',
  username: 'Ian The Hunter',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183072/44059754.jpg'
})

User.create({
  email: 'jascha@sharemyride.tech',
  password: '123456',
  first_name: 'Jascha',
  last_name: 'Drel',
  username: 'The Flying Dutchman',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183071/42733581.png'
})




#2
User.create({
  email: 'julia@sharemyride.tech',
  password: '123456',
  first_name: 'Julia',
  last_name: 'Cocco',
  username: 'J.Cocco',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183070/42177265.jpg',
})

User.create({
  email: 'lucas@sharemyride.tech',
  password: '123456',
  first_name: 'Lucas',
  last_name: 'Rocha',
  username: 'Lucas Da Rocha',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183070/42940098.jpg',
})

User.create({
  email: 'donald@sharemyride.tech',
  password: '123456',
  first_name: 'Donlad',
  last_name: 'Trump',
  username: 'Donald J Trump',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544184292/9026192-3x2-700x467.jpg',
})

User.create({
  email: 'lamina@sharemyride.tech',
  password: '123456',
  first_name: 'Lamina',
  last_name: 'Vedder',
  username: 'LaminaV',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183070/42808135.jpg',
})

User.create({
  email: 'pierre@sharemyride.tech',
  password: '123456',
  first_name: 'Pierre',
  last_name: 'Hervé Basin',
  username: 'PHB',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/42039881.png',
})

User.create({
  email: 'alfonso@sharemyride.tech',
  password: '123456',
  first_name: 'Alfonso',
  last_name: 'Garcia De Corral',
  username: 'Xx_Al_GDC_xX',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/35847472.png',
})


#3
User.create({
  email: 'mathias@sharemyride.tech',
  password: '123456',
  first_name: 'Mathias',
  last_name: 'Sellam',
  username: 'TheMightyMathias',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/38690859.jpg',
})

User.create({
  email: 'xun@sharemyride.tech',
  password: '123456',
  first_name: 'Xun',
  last_name: 'Ma',
  username: 'XunXunXun',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/43337020.jpg',
})

User.create({
  email: 'drevil@sharemyride.tech',
  password: '123456',
  first_name: 'Dr',
  last_name: 'Evil',
  username: 'DrEvil1998',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/200px-Drevil_million_dollars.jpg',
})


User.create({
  email: 'marina@sharemyride.tech',
  password: '123456',
  first_name: 'Marina',
  last_name: 'Kjaer',
  username: 'MarinaK',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/38080513.png',
})

User.create({
  email: 'annie@sharemyride.tech',
  password: '123456',
  first_name: 'Annie',
  last_name: 'Gilchrist',
  username: 'Annie G (not ali G)',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183068/42188961.png',
})

User.create({
  email: 'daniel@sharemyride.tech',
  password: '123456',
  first_name: 'Daniel',
  last_name: 'Mera De Agustin',
  username: 'Para Justicia',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/11755954.jpg',
})

#4
User.create({
  email: 'sergi@sharemyride.tech',
  password: '123456',
  first_name: 'Sergi',
  last_name: 'Campos',
  username: 'El Catalan',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/43750993.jpg',
})

User.create({
  email: 'vianney@sharemyride.tech',
  password: '123456',
  first_name: 'Vianney',
  last_name: 'De Boisredon',
  username: 'VDB',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/43636442.jpg'
})

User.create({
  email: 'borat@sharemyride.tech',
  password: '123456',
  first_name: 'Borat',
  last_name: 'Ehh',
  username: 'Borat',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544183067/Ado4FXGS_400x400.jpg',
})

User.create({
  email: 'ryan@sharemyride.tech',
  password: '123456',
  first_name: 'Ryan',
  last_name: 'Propst',
  username: 'RyanP',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544177778/j6grr6cqji4zinekpsuo.jpg'
})

User.create({
  email: 'goga@sharemyride.tech',
  password: '123456',
  first_name: 'Goga',
  last_name: 'Hayrapetyan',
  username: 'Goga2004',
  remote_photo_url: 'https://res.cloudinary.com/duuzgb6vl/image/upload/v1544180827/ckmeirbpmnqj8mv0xvxv.jpg',
})

User.create({
  email: 'marco@sharemyride.tech',
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
  time: Time.new(2018,12,13,19,30),
  estimate: 8.14,
  # date: Date.new(2018,12,14),
  user_id: 1,
  airport_id: Airport.where(iata_code:"DPS").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Kubu, Bangli Sub-District',
  latitude: -8.4303071,
  longitude: 115.36375929999997,
  time: Time.new(2018,12,13,18,40),
  estimate: 14.14,
  # date: Date.new(2018,12,14),
  user_id: 2,
  airport_id: Airport.where(iata_code:"DPS").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Bali Volcano',
  latitude: -8.224417899999997,
  longitude: 115.39595129999998,
  time: Time.new(2018,12,13,18,50),
  estimate: 120.14,
  # date: Date.new(2018,12,14),
  user_id: 3,
  airport_id: Airport.where(iata_code:"DPS").ids.join.to_i,
  ride_mates_limit: 3
})

#Melbourne Trip

Trip.create!({
  terminal: '1',
  destination: 'Cup Of Truth café',
  latitude: -37.8177625,
  longitude: 144.96598829999994,
  time: Time.new(2018,12,13,21,50),
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
  time: Time.new(2018,12,13,20,50),
  estimate: 50.14,
  # date: Date.new(2018,12,14),
  user_id: 8,
  airport_id: Airport.where(iata_code:"MLB").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Melbourne Showground',
  latitude: -37.7802949,
  longitude: 144.91482559999997,
  time: Time.new(2018,12,13,18,10),
  estimate: 40.14,
  # date: Date.new(2018,12,14),
  user_id: 9,
  airport_id: Airport.where(iata_code:"MLB").ids.join.to_i,
  ride_mates_limit: 3
})

# Panama

Trip.create!({
  terminal: '1',
  destination: 'Technological University of Panama',
  latitude: 9.0238187,
  longitude: -79.53153980000002,
  time: Time.new(2018,12,13,15,50),
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
  time: Time.new(2018,12,13,16,50),
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
  time: Time.new(2018,12,13,19,30),
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
  time: Time.new(2018,12,13,21,30),
  estimate: 40.14,
  # date: Date.new(2018,12,14),
  user_id: 19,
  airport_id: Airport.where(iata_code:"CDG").ids.join.to_i,
  ride_mates_limit: 3
})

Trip.create!({
  terminal: '1',
  destination: 'Sacré-Cœur',
  latitude: 48.88670459999999,
  longitude: 2.34310430000005,
  time: Time.new(2018,12,13,19,50),
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
  time: Time.new(2018,12,13,17,40),
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
  destination: 'Jl.raya singapadu, no.888, br.apauan, des.singapadu, kec.sukawati, Singapadu, Sukawati, Kabupaten Gianyar, Bali 80582, Indonesia',
  longitude: -8.5918844057982 ,
  latitude: 115.26649475097656,
})

Ridemate.create({
  user_id: 5,
  trip_id: 1,
  destination: 'Renon, Denpasar Selatan, Panjer, Denpasar Sel., Kota Denpasar, Bali 80234, Indonesia',
  longitude: -8.66995440565646,
  latitude: 115.23387908935547,
})

Ridemate.create({
  user_id: 6,
  trip_id: 2,
  destination: 'Jl. Pantai Legian, Legian, Kuta, Kabupaten Badung, Bali, Indonesia',
  longitude: -8.697784143504906,
  latitude: 115.16178131103516,
})

Ridemate.create({
  user_id: 10,
  trip_id: 4,
  destination: '11 Collins St, Melbourne VIC 3004, Australia',
  longitude: -37.813784667931245,
  latitude: 144.9734401702881,
})

Ridemate.create({
  user_id: 11,
  trip_id: 4,
  destination: '200 St Kilda Rd, Southbank VIC 3006, Australia',
  longitude: -37.82253123860033,
  latitude: 144.96889114379883,
})

Ridemate.create({
  user_id: 12,
  trip_id: 5,
  destination: 'Bay Trail, Port Melbourne VIC 3207, Australia',
  longitude: -37.84097022350016,
  latitude: 144.9269199371338,
})

Ridemate.create({
  user_id: 16,
  trip_id: 7,
  destination: 'State Park Cir, Panama City, FL 32408, USA',
  longitude: 30.133399313136763,
  latitude: -85.73850631713867,
})

Ridemate.create({
  user_id: 17,
  trip_id: 7,
  destination: '9323 Front Beach Rd, Panama City Beach, FL 32407, USA',
  longitude: 30.179115283839486,
  latitude: -85.79412460327148,
})

Ridemate.create({
  user_id: 18,
  trip_id: 8,
  destination: '2205 E 5th St, Panama City, FL 32401, USA',
  longitude: 30.15703919399514,
  latitude: -85.63025236129761,
})


Ridemate.create({
  user_id: 22,
  trip_id: 10,
  destination: '14 Rue Bonaparte, 75006 Paris, France',
  longitude: 48.85686581838981,
  latitude: 2.3337364196777344,
})

Ridemate.create({
  user_id: 23,
  trip_id: 10,
  destination: 'Pont Alexandre III, Pont Alexandre III, 75008 Paris, France',
  longitude: 48.863924276481605,
  latitude: 2.3134803771972656,
})

Ridemate.create({
  user_id: 24,
  trip_id: 11,
  destination: 'Le Panthéon, 75005 Paris, France',
  longitude: 48.846248023032196,
  latitude: 2.346353530883789,
})

