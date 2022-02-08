# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Property.destroy_all

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
  user_id: @user.id,
  availability: true
)
puts "created property & #{@property.id}"
