# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["trail", "skyrace", "road", "vertical"].each do |t|
  RaceType.create(typology: t)
end

{ "short" => "0-22km", "medium" => "23-43km", "long" => "44-100km", "ultra" => ">100km"}.each do |k,v|
  RaceDistance.create(distance_type: k, label: v)
end


User.create(
  email: "guido@guido.com",
  password: "password",
  username: "guido",
)

30.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    username: Faker::Games::Pokemon.name
  )
end
100.times do
  r = Race.new(
    name:Faker::Movies::Hobbit.character ,
    location: ["Torino, TO, Italy", "Milano, MI, Italy", "Bergamo, BG, Italy", "Cremona, Cr, Itali"].sample,
    distance_km: rand(10...100),
    user_id: User.all.sample.id,
    price: rand(30...100),
    website: "www.test.com",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
    date: Date.today + rand(50..200),
    race_type: ["trail", "skyrace", "road"].sample
  )
  r.elevation = [1000,2000,3000].sample unless r.race_type == "road"
  r.save
end
