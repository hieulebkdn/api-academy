# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create! email: "sinh@academy.org", phone: Faker::PhoneNumber.cell_phone,
# name: "Sinh dep trai" , role: "admin", password: "foobar", password_confirmation: "foobar"

# Account.create! address: Faker::Address.street_address, dob: Faker::Date.between(9000.days.ago, 6000.days.ago),
#   gender: Faker::Number.between(0,1), parent_name: Faker::Dota.hero, parent_phone: Faker::PhoneNumber.cell_phone, user_id: 11

# 20.times do |n|
#   email = "student#{n+1}@academy.org"
#   password = "matkhau"
#   User.create! email: email, password: password, password_confirmation: password,
#   name: Faker::LeagueOfLegends.champion, role: "student",  phone: Faker::PhoneNumber.cell_phone
# end

# 20.times do |n|
#   Account.create! address: Faker::Address.street_address, dob: Faker::Date.between(9000.days.ago, 6000.days.ago),
#   gender: Faker::Number.between(0,1), parent_name: Faker::Dota.hero, parent_phone: Faker::PhoneNumber.cell_phone, user_id: (n+2)*10+1
# end

# 20.times do |n|
#   email = "teacher#{n+1}@academy.org"
#   password = "matkhau"
#   User.create! email: email, password: password, password_confirmation: password,
#   name: Faker::LeagueOfLegends.champion, role: "teacher",  phone: Faker::PhoneNumber.cell_phone
# end

# 6.times do |n|
#   Account.create! address: Faker::Address.street_address, dob: Faker::Date.between(9000.days.ago, 6000.days.ago),
#   gender: Faker::Number.between(0,1), parent_name: Faker::Dota.hero, parent_phone: Faker::PhoneNumber.cell_phone, user_id: (n+22)*10+1
# end