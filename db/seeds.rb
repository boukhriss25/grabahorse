# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database of all users...'
User.destroy_all
puts 'Initiating users seed...'

User.create(
  email: "john@john.com",
  password: "password"
)

# puts 'Cleaning database of all horses...'
# Horse.destroy_all
# puts 'Initiating horses seed...'

# 20.times do
#   Horse.create(
#     name: Faker::Creature::Horse.name,
#     location: Faker::Address.city,
#     price: rand(25..75),
#     description: Faker::Coffee.notes,
#     user: User.all.sample
#     )
# end


