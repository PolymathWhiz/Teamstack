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

users = User.all
user  = users.first
following = users[2..990]
followers = users[3..985]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }