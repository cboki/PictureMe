# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning up database...'
puts 'Cleaning all the users...'
User.destroy_all

puts 'Cleaning all the photographers...'
Photographer.destroy_all

puts 'Cleaning all the appointments and reviews...'
Appointment.destroy_all
Review.destroy_all

puts 'Cleaning all the photos...'
Photo.destroy_all

puts 'Cleaning all the categories...'
Category.destroy_all
PhotographerCategory.destroy_all

PHOTOS_URLS = [ 'https://cdn.shopify.com/s/files/1/0684/3259/files/5.jpg',
               'https://cdn.shopify.com/s/files/1/0684/3259/files/4_9465cdb2-b026-4cec-bc32-7fcdf4e90604.jpg',
               'https://cdn.shopify.com/s/files/1/0684/3259/files/2_8c8fa4cc-8140-4558-a2aa-c1b7d9276959.jpg',
               'https://cdn.shopify.com/s/files/1/0684/3259/files/5N1A9329.jpg']

puts 'Creating new users...'
10.times do
  first_name, last_name = Faker::FunnyName.two_word_name.split
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.email(first_name),
    password: '123456',
    phone_number: Faker::PhoneNumber.phone_number
    )
  user.save
end

  # photo = Photo.new(url: PHOTOS_URLS.sample)
