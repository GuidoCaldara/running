# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
    date: Date.today + rand(50..200),
    race_type: ["trail", "skyrace", "road"].sample
  )
  r.save
end
