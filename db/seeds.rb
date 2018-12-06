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
GITHUB_NAMES = [['Antoine', 'welan125'], ['Ben', 'BenDu89'], ['Carolina', 'carolinalemos'], ['Chris', 'sisserian'], ['Vasco', 'kauredo'], ['Clélia', 'UpClelia'], ['Clément', 'cboki'], ['Daniel', 'dfmore'], ['Jonny', 'jonnymarshall'], ['Manuel', 'mlrcbsousa'], ['Mathilde','matbrg'], ['Paul', 'pbusby'], ['Thibaut', 'Bitais']]
CITIES = %w[Paris London Amsterdam Lisbon Berlin Rio Bali Lyon Lille Mexico Tokyo Milan Brussels Barcelona]
STATUS = %w[pending accepted rejected finished]
REVIEWS = [[ 5, 'This photographer is super mega cool !'], [ 5, 'Fantastic job ! I highly recommend'],
[ 5, 'Awesome job !'],[ 4,' great experience, I love my new photos'], [ 3, 'Nice pictures for my personal book' ],
[ 5, 'I LOVE all the photos we took this day'], [ 4, 'Thank you for this day'], [ 3, 'Regular experience'], [ 2, 'The photographer was late !!!']]

puts 'Creating new users...'
20.times do
  name_sample = GITHUB_NAMES.sample

  user = User.new(
    first_name: name_sample.first,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    phone_number: Faker::PhoneNumber.phone_number,
    avatar: "https://kitt.lewagon.com/placeholder/users/#{name_sample.last}"
    )
  user.save
end

puts 'Creating new photographers...'
User.all.each do |user|
  photographer = Photographer.new(
    location: CITIES.sample,
    language: Faker::Nation.language,
    daily_price: rand(50..150)
    )
  photographer.user = user
  photographer.save
end

puts 'Creating new appointments and reviews...'
User.all.each do |user|
  5.times do
    photographer = Photographer.find(Photographer.pluck(:id).sample)
    appointment = Appointment.new(
      date: Faker::Date.between(1.year.ago, 1.year.from_now),
      user: user,
      photographer: photographer,
      location: photographer.location,
      status: STATUS.sample
    )
    appointment.save

rev_sample = REVIEWS.sample
    review = Review.new(
      appointment: appointment,
      stars: rev_sample.first,
      content: rev_sample.last)
    review.save
  end
end

puts 'Adding photos to photographers...'
Photographer.all.each do |photographer|
 photo = Photo.new(url: PHOTOS_URLS.sample)
 photo.photographer = photographer
 photo.save
end

puts 'Creating new categories'
CATEGORIES = ['Black and White', 'Clubbing', 'Wedding', 'Drone', 'GoPro',
              'Party', 'Underwater', 'Video', 'Photoshop', 'Professional', 'Portrait', 'Old style']

CATEGORIES.each do |item|
  category = Category.create(name: item)
end
25.times do
  photographer_category = PhotographerCategory.new
  photographer_category.category = Category.find(Category.pluck(:id).sample)
  photographer_category.photographer = Photographer.find(Photographer.pluck(:id).sample)
  photographer_category.save
end

puts 'Seed OK!'
