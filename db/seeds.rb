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
               'https://cdn.shopify.com/s/files/1/0684/3259/files/5N1A9329.jpg',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aea57f370a6ad7a605eb6d1/1531054157764/paris-photographers-2.jpg?format=750',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aea57f103ce646e4cecd944/1531054157761/paris-photographers-1.jpg',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aea57f8562fa782f1b06cbc/1531054157766/paris-photographers-3.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aea58290e2e725df95aba58/1531054157768/paris-photographers-4.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aeafb17352f537f2ea43e3e/1531054157769/paris-photographers-5.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/59568fb71e5b6ca37129f731/59568fb803596ee34c0d8054/1531054157788/paris-photographer+1.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/59568fb71e5b6ca37129f731/59568ff472af657b60300a22/1531054157790/paris-photographer+2.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/59568fb71e5b6ca37129f731/5956900bb6ac50c34ea35743/1531054157792/paris-photographer.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/59568fb71e5b6ca37129f731/5956902c86e6c093be88428b/1531054157793/paris-photographers.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5bc6dfb353450aa3a7736f92/5bc6dfd5e2c483c657dd1f18/1539760161537/lisbon-photographers-3.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5bc6dfb353450aa3a7736f92/5bc6e010eef1a12e14c5e3eb/1539760183125/lisbon-photographers-5.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/58fe3950ff7c500a04eea88e/58fe395d8419c2c6c89df19a/1493055993563/Lisbon-Photographer+5.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5ab593bc03ce64865010c7b3/5ab593ed562fa77d176c92da/1521849365435/berlin-photographer-3.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5ab593bc03ce64865010c7b3/5ab593c48a922d7af06ede18/1521849336701/berlin-photographer-1.jpg?format=750w']
GITHUB_NAMES = [['Antoine', 'welan125'], ['Ben', 'BenDu89'], ['Carolina', 'carolinalemos'], ['Chris', 'sisserian'], ['Vasco', 'kauredo'], ['Clélia', 'UpClelia'], ['Clément', 'cboki'], ['Daniel', 'dfmore'], ['Jonny', 'jonnymarshall'], ['Manuel', 'mlrcbsousa'], ['Mathilde','matbrg'], ['Paul', 'pbusby'], ['Thibaut', 'Bitais']]
CITIES = %w[Paris London Amsterdam Lisbon Berlin Rio Bali Lyon Lille Mexico Tokyo Milan Brussels Barcelona]
STATUS = %w[pending accepted rejected finished]
REVIEWS = [[ 5, 'This photographer is super mega cool !'], [ 5, 'Fantastic job ! I highly recommend'],
[ 5, 'Awesome job !'],[ 4,' great experience, I love my new photos'], [ 3, 'Nice pictures for my personal book' ],
[ 5, 'I LOVE all the photos we took this day'], [ 4, 'Thank you for this day'], [ 3, 'Regular experience'], [ 2, 'The photographer was late !!!']]

puts 'Creating new users...'
GITHUB_NAMES.each do |arr|

  user = User.new(
    first_name: arr.first,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    phone_number: Faker::PhoneNumber.phone_number,
    avatar: "https://kitt.lewagon.com/placeholder/users/#{arr.last}"
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
  PHOTOS_URLS.sample(6).each do |url|
   photo = Photo.new(url: url)
   photo.photographer = photographer
   photo.save
  end
end

puts 'Creating new categories'
CATEGORIES = ['Black and White', 'Clubbing', 'Wedding', 'Drone', 'GoPro',
              'Party', 'Underwater', 'Video', 'Photoshop', 'Professional', 'Portrait', 'Old style', 'Nature']

CATEGORIES.each do |item|
  category = Category.create(name: item)
end
Photographer.all.each do |photographer|
  3.times do
    photographer_category = PhotographerCategory.new
    photographer_category.category = Category.find(Category.pluck(:id).sample)
    photographer_category.photographer = photographer
    photographer_category.save
  end
end

puts 'Seed OK!'
