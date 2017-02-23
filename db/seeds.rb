# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Admin", email: "admin@hotmail.com", password: "123456", password_confirmation: "123456")

room_type = [
  [ "single", 5 ],
  [ "double", 5 ],
  [ "triple", 3 ],
  [ "luxury", 3 ]
]

id = 100
room_type.each do |type, count|
  (1..count).step do |c|
    Room.create(room_id: id + c, room_type: type, status: 0)  
  end
  id += 100
end
