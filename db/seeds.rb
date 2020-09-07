# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "phu.nguyen.cse@hcmut.edu.vn", firstname: "Jame", lastname: "Nguyen", password: "vinamilk123")
User.create(email: "admin@hcmut.edu.vn", firstname: "Admin", password: "mothaibabon", admin: true)
User.create(email: "admin@gmail.com", firstname: "Jame", password: "123789", active: false)
User.create(email: "xxx@yopmail.com", firstname: "Yop", lastname: "Xxx", password: "xxxxxx")
User.create(email: "ducphu.1906@gmail.com", firstname: "Phu", lastname: "Duc", password: "asdfgh")
User.create(email: "admin@yopmail.com", firstname: "Admin", lastname: "Yop", password: "yopmailadmin", admin: true)

Photo.create(title: "Doggo", source: "img/doggo.jpeg", user_id: 2)

Album.create(tilte: "new album", user_id: 1)
Album.create(title: "Cat", user_id: 1)
Album.create(title: "Beach", user_id: 5)
Album.create(title: "doggo")
Album.create(title: "xxx", user_id: 1)
Album.create(title: "XXX no.1", user_id: 4)
Album.create(title: "XXX no.2", user_id: 4)
Album.create(title: "new xxx", user_id: 4)
Album.create(title: "new xxx for user 1", user_id: 1)
Album.create(title: "album of admin yop", user_id: 6)

Follow.create(follower_id: 1, followee_id: 2)
Follow.create(follower_id: 1, followee_id: 4)
