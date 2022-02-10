# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Property.destroy_all
User.destroy_all

puts "creating user"
@user = User.create!(first_name: "Peter", last_name: "Pan", email: "ppan@gmail.com", password: "123456", owner_profile: true)
puts "created user & #{@user.id}"

puts "creating property"
@property = Property.create!(
  description: "magical",
  name: "neverland",
  location: "the space",
  category: "castle",
  theme: "fairy tail",
  price: 100,
  user_id: User.last.id,
  availability: true
)
puts "created property & #{@property.id}"

require 'faker'

puts 'creating 5 fake users..'
@users_array = []
5.times do
  @users = User.new(
    first_name:  Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:  Faker::Internet.email,
    password:  Faker::Internet.password(min_length: 6),
    owner_profile:  Faker::Boolean.boolean(true_ratio: 0.2)
  )
  @users.save!
  @users_array << @users
end

puts 'creating 5 fake properties..'
5.times do
  property = Property.new(
    description:  Faker::Fantasy::Tolkien.poem,
    name:  Faker::Fantasy::Tolkien.character,
    location:  Faker::Nation.capital_city,
    user_id: @users_array.sample.id,
    category:  Faker::Vehicle.car_type,
    theme:  Faker::Emotion.adjective,
    price: rand(10..500),
    availability:  Faker::Boolean.boolean(true_ratio: 0.8)
  )
  property.save!
end
