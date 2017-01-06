# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Team.destroy_all
School.destroy_all
Mentor.destroy_all

def create_city
  city_name = ["Houston", "San Antonio", "Austin", "Dallas", "Salt Lake City", "Las Vegas", "Tampa Bay", "Orlando", "Atlanta", "Durham", "Raleigh", "Charleston", "Charlotte", "Cincinnati", "Columbia", "Detroit", "Greenville", "Indianapolis", "Minneapolis", "Nashville", "Washington, D.C."]
  city_name.each do |city|
    school = School.new
    school.city = city
    school.save!
  end
end

def create_team
  team = Team.new
  team.name = Faker::ChuckNorris.fact
  team.uid = Faker::Internet.password(8)
  team.save!
end

20.times do
  create_team
end

def create_mentor(city)
  mentor = Mentor.new
  mentor.first_name = Faker::Name.first_name
  mentor.last_name = Faker::Name.last_name
  mentor.email = Faker::Internet.email
  mentor.github_username = Faker::Name.first_name
  mentor.schools << city
  mentor.save!
end

def create_user(city)
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password(8)
  user.github_username = Faker::Hipster.words(3)
  user.school_id = city.id
  user.save!
end

def create_judge
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = '12345678'
  user.github_username = Faker::Name.last_name
  user.judge = true
  user.save!
end

10.times do
  create_judge
end

create_city

15.times do
  create_mentor(School.all.sample)
end

School.all.each do |city|
  (4..10).to_a.sample.times do
    create_user(city)
  end
  create_mentor(city)
end

Team.all.each do |team|
  school = School.all.sample
  users = User.where(school_id: school.id)

  (3..5).to_a.sample.times do
    team.users << users.all.sample
  end

  school.teams << team
end
