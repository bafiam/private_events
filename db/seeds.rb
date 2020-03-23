# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# creating 10 users

admin = User.create!(name:  "admin",
             email: "admin@microverse.com")

9.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@microverse.org"
    User.create!(name:  name,
                 email: email)
end

# creating 2 events per user

users = User.all
2.times do |m|
  users.each do |user|
      title = "#{user.name}'s-#{m+1} Event"
      description = Faker::Lorem.sentence(word_count: 4)
      user.events.create!(name: title,
                        description: description,
                        date: DateTime.now + rand(-5..5))
  end
end

# Inviting all users to the first event created by user 1 "admin"

9.times do |n|
    Booking.create!(attendee_id:  n + 2,
                    attended_event_id: 1)
end