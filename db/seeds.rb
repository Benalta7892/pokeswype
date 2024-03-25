require "json"
require "open-uri"

puts "Destroying all data..."

Review.destroy_all
Message.destroy_all
CardInterest.destroy_all
UserCard.destroy_all
Chatroom.destroy_all
Exchange.destroy_all
CardWish.destroy_all
Card.destroy_all
User.destroy_all

puts "Creating users..."

pierre = User.create!(first_name: "Pierre", last_name: "Rochard", nickname: "pierre1", email: "pierre.r@gmail.com", password: "123456", address: "Paris", latitude: 48.8566, longitude: 2.3522, global_rating: 4, avatar: "pierre-avatar.png")
ondine = User.create!(first_name: "Ondine", last_name: "Floravive", nickname: "ondine2", email: "ondine.f@gmail.com", password: "123456", address: "Lausanne", latitude: 46.5196535, longitude: 6.6322734, global_rating: 5, avatar: "ondine-avatar.png")
sacha = User.create!(first_name: "Sacha", last_name: "Ketchum", nickname: "sacha3", email: "sacha.k@gmail.com", password: "123456", address: "Marseille", latitude: 43.300000, longitude: 5.400000, global_rating: 3, avatar: "sacha-avatar.png")
flora = User.create!(first_name: "Flora", last_name: "Laurène", nickname: "flora4", email: "flora.l@gmail.com", password: "123456", address: "New York", latitude: 40.7128, longitude: -74.0060, global_rating: 3, avatar: "flora-avatar.png")
aurore = User.create!(first_name: "Aurore", last_name: "Berlitz", nickname: "aurore5", email: "aurore.b@gmail.com", password: "123456", address: "Rio de Janeiro", latitude: -22.9068, longitude: -43.1729, global_rating: 5, avatar: "aurore-avatar.png")
serena = User.create!(first_name: "Serena", last_name: "Tsukino", nickname: "serena6", email: "serena.t@gmail.com", password: "123456", address: "Tokyo", latitude: 35.6895, longitude: 139.6917, global_rating: 4, avatar: "serena-avatar.png")
regis = User.create!(first_name: "Régis", last_name: "Chenal", nickname: "régis7", email: "regis.c@gmail.com", password: "123456", address: "Sydney", latitude: -33.8688, longitude: 151.2093, global_rating: 3, avatar: "regis-avatar.png")
professeur = User.create!(first_name: "Professeur", last_name: "Chen", nickname: "professeur8", email: "professeur.c@gmail.com", password: "123456", address: "Le Cap", latitude: -33.9249, longitude: 18.4241, global_rating: 5, avatar: "professeur-avatar.png")
jessie = User.create!(first_name: "Jessie", last_name: "Rocket", nickname: "jessie9", email: "jessie.r@gmail.com", password: "123456", address: "Mexico", latitude: -33.9249, longitude: 18.4241, global_rating: 5, avatar: "jessie-avatar.png")
james = User.create!(first_name: "James", last_name: "Rocket", nickname: "james10", email: "james.r@gmail.com", password: "123456", address: "Rome", latitude: 41.9028, longitude: 12.4964, global_rating: 5, avatar: "james-avatar.png")

puts "Creating cards..."

url = "https://api.pokemontcg.io/v2/cards?"
card_serialized = URI.open(url).read
cards = JSON.parse(card_serialized)

cards['data'].first(100).each do |data|
  card = Card.create!(name: data['name'], price: data['cardmarket']['prices']['trendPrice'], serie: data['set']['series'], extension: data['set']['name'], released_date: data['set']["releaseDate"], number: data['number'], rarity: data['rarity'], category: data['types'].first, image: data['images']['small'])
  puts "#{card['name']}"
end

puts "Creating user_cards ..."

user = User.find_by(first_name: "Pierre")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "Flora")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "Aurore")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "Serena")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "Régis")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "James")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "Professeur")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "Jessie")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "Ondine")
Card.all.each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

user = User.find_by(first_name: "Sacha")
Card.first(50).each do |card|
  UserCard.create(user: user, card: card, exchangeable: true)
end

puts "Finished!"
