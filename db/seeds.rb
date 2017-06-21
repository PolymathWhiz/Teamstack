# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name:  "Miracle",
             last_name: "Anyanwu",
             email: "anyanwumiracle78@gmail.com",
             password:              "m12345678",
             password_confirmation: "m12345678",
             twitter: "polymathwhiz",
             github: "polymathwhiz"        
             )

1000.times do |n|
  first_name  = Faker::Name.name
  last_name = Faker::Name.name
  email = "user-#{n+1}@codezen.xyz"
  password = "password"

  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               password:              password,
               password_confirmation: password,
               )
end