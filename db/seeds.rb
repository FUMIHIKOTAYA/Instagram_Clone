50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  profile = Faker::Quotes::Shakespeare.hamlet_quote
  image = File.open("./public/images/icon.png")
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               profile: profile,
               image: image,
               )
end
