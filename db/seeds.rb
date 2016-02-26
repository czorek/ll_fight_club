# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

User.create(email: 'john@example.com', password: 'password', password_confirmation: 'password')
User.create(email: 'jenny@example.com', password: 'password', password_confirmation: 'password')

User.all.each do |user|
  15.times do |num|
    Fighter.create(user: user, first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name,
                   description: FFaker::Lorem.paragraph, avatar: File.open(File.join(Rails.root, 'db/placeholders/250x300.png')))
  end
end
