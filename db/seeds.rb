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

puts 'Cleaning database of all horses...'
Horse.destroy_all
puts 'Initiating horses seed...'

locations = ["Barcelona", "Paris", "Casalanca", "Medellin", "Milan", "Swindon"]

images = [
  "https://www.sciencenews.org/sites/default/files/2018/02/main/articles/022118_EE_horses_feat.jpg",
  "https://images2.minutemediacdn.com/image/upload/c_crop,h_1194,w_2121,x_0,y_34/f_auto,q_auto,w_1100/v1553786510/shape/mentalfloss/539787-istock-879570436.jpg"
]

20.times do
  Horse.create(
    name: Faker::Creature::Horse.name,
    location: locations.sample,
    price: rand(25..75),
    description: Faker::Coffee.notes,
    user: User.all.sample,
    remote_image_url: images.sample
    )
end


