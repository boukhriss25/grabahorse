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

User.create(
  email: "amine@gmail.com",
  password: "password"
)

User.create(
  email: "rita@gmail.com",
  password: "password"
)

User.create(
  email: "mehdi@gmail.com",
  password: "password"
)

User.create(
  email: "glend@gmail.com",
  password: "password"
)
User.create(
  email: "wendy@gmail.com",
  password: "password"
)

User.create(
  email: "thoma@gmail.com",
  password: "password"
)

User.create(
  email: "victor@gmail.com",
  password: "password"
)

User.create(
  email: "claude@gmail.com",
  password: "password"
)

User.create(
  email: "robin@gmail.com",
  password: "password"
)

User.create(
  email: "sebastien@gmail.com",
  password: "password"
)

puts 'Cleaning database of all horses...'
Horse.destroy_all
puts 'Initiating horses seed...'

locations = ["08820 El Prat de Llobregat, Barcelona",
  "Carretera de Torroella, 0, Km 1 200, 17140 Ullà, Girona",
  "Passatge de Domingo, 3, 08007 Barcelona",
  "Passeig Muntanya s/n (Can Vilà), 08960 Sant Just Desvern, Barcelona",
  "Carrer de Sardenya, 373, 08025 Barcelona",
  "Carrer de l'Hospital, 155, 08001 Barcelona",
  "62 Campden St, Kensington, London W8 7EL, UK",
  "10 Downing St, Westminster, London SW1A 2AA, UK",
  "Pier Street, Isle of Dogs, London E14 3HP, UK",
  "38 Great Eastern St, Hackney, London EC2A 3ES, UK",
  "258 Edgware Rd, London W2 1DU, UK",
  "Overhoeksplein 2, 1031 KS Amsterdam, Netherlands",
  "Stationsplein, 1012 AB Amsterdam, Netherlands"
]

breeds = ["Andalusian horse", "Mustang", "American Horse", "Shire horse", "Tennesse Walking Horse", "Shetland pony"]

images = [
  "https://www.sciencenews.org/sites/default/files/2018/02/main/articles/022118_EE_horses_feat.jpg",
  "https://images2.minutemediacdn.com/image/upload/c_crop,h_1194,w_2121,x_0,y_34/f_auto,q_auto,w_1100/v1553786510/shape/mentalfloss/539787-istock-879570436.jpg",
  "https://i.ytimg.com/vi/_QhJ27VGD0E/maxresdefault.jpg",
  "https://i.ytimg.com/vi/Ss-UaXeJKEY/maxresdefault.jpg",
  "https://www.horsebreedspictures.com/wp-content/uploads/2015/09/American-Paint-Horse-Pictures.jpg",
  "https://i.ytimg.com/vi/8DYCfEBovl0/maxresdefault.jpg",
  "https://equusmagazine.com/.image/t_share/MTQ1Mjc2NDE4Mzk1MjE5MzUy/feral-horse-and-foal-walk-along-the-beach-on-vieques-island-off-puerto-rico.jpg"
]

20.times do
  Horse.create(
    name: Faker::Creature::Horse.name,
    location: locations.sample,
    price: rand(25..75),
    description: breeds.sample,
    user: User.all.sample,
    remote_image_url: images.sample
    )
end


