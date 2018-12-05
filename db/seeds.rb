# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning up database...'
puts 'Cleaning all the photographers...'
Photographer.destroy_all
puts 'Cleaning all the users...'
User.destroy_all


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
30.times do
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

puts 'Creating new photographers...'
User.first(10).each do |user|
  photographer = Photographer.new(
    location: Faker::Address.city,
    language: Faker::Nation.language,
    daily_price: Faker::Number.number(3)
    )
  photographer.user = user
  photographer.save
end

puts 'Creating new appointments and reviews...'
10.times do
  user = User.find(User.pluck(:id).sample)
  photographer = Photographer.find(Photographer.pluck(:id).sample)

  appointment = Appointment.new(
    date: Faker::Date.between(1.year.ago, 1.year.from_now),
    user: user,
    photographer: photographer,
    location: photographer.location,
    status: "pending"
  )
  appointment.save

  review = Review.new(
    stars: rand(1..5),
    appointment: appointment)
  review.save
end

puts 'Adding photos to photographers...'
Photographer.all.each do |photographer|
 photo = Photo.new(url: PHOTOS_URLS.sample)
 photo.photographer = photographer
 photo.save
end

puts 'Creating new categories'
CATEGORIES = ['Black and White', 'Clubbing', 'Wedding', 'Drone', 'GoPro',
              'Party', 'Underwater', 'Video', 'Photoshop', 'Professional']

CATEGORIES.each do |item|
  category = Category.create(name: item)
end
10.times do
photographer_category = PhotographerCategory.new
photographer_category.category = Category.find(Category.pluck(:id).sample)
photographer_category.photographer = Photographer.find(Photographer.pluck(:id).sample)
photographer_category.save
end

puts 'Seed OK!'
