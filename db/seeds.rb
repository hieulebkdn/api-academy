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

# 5.times do |n|
#   Course.create! name: Faker::Educator.course, fee: Faker::Number.between(300,1000), duration: Faker::Number.between(1,15) 
# end

# 5.times do |n|
#   Course.create! name: Faker::Educator.course, fee: Faker::Number.between(300,1000), duration: Faker::Number.between(1,15) 
# end
# listCourseIDS = Course.all.pluck :id

# 10.times.do |n|
#   ClassRoom.create! name: Faker::Educator.course, course_id: listCourseIDS.sample
# end

# listStudentIDS = User.where(role: "student").pluck :id
# listTeacherIDS = User.where(role: "teacher").pluck :id
# listClassIDS = ClassRoom.all.pluck :id
# 40.times do |n| 
#   ClassRoomUser.create! user_id: listStudentIDS.sample, class_room_id: listClassIDS.sample
# end

# 10.times do |n|
#   ClassRoomUser.create! user_id: listTeacherIDS.sample, class_room_id: listClassIDS.sample, is_teacher: true
# end

# weekday = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
# start_time = ["8:00", "15:00", "17:00", "19:00"]
# end_time = ["10:00", "17:00", "19:00", "21:00"]
# weekday.each do |day|
#   4.times do |n|
#     Timetable.create! weekday: day, start_time: start_time[n], end_time: end_time[n]
#   end
# end

listTimetableIDs = Timetable.all.pluck :id
listClassRoomIDs = ClassRoom.all.pluck :id

listClassRoomIDs.each do |id|
  2.times do |n|
  ClassRoomTimetable.create! class_room_id: id, timetable_id: listTimetableIDs.sample
end
end