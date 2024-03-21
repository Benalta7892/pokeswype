require "json"
require "open-uri"

puts "Destroying all data..."

Message.destroy_all
CardInterest.destroy_all
UserCard.destroy_all
Chatroom.destroy_all
Exchange.destroy_all
Card.destroy_all
User.destroy_all


# puts "Creating usersmessage"

# Chatroom.create!(name: "general")

puts "Creating users..."

john = User.create!(first_name: "John", last_name: "Doe", nickname: "johny1", email: "john.doe@gmail.com", password: "123456", address: "Paris", latitude: 48.8566, longitude: 2.3522, global_rating: 1, avatar: "sacha-avatar.png")
remy = User.create!(first_name: "Remy", last_name: "Cardinal", nickname: "remy2", email: "remy.cardinal@gmail.com", password: "123456", address: "Lausanne", latitude: 46.5196535, longitude: 6.6322734, global_rating: 1, avatar: "sacha-avatar.png")
sacha = User.create!(first_name: "Sacha", last_name: "Bouvier", nickname: "sacha3", email: "sacha.bouvier@gmail.com", password: "123456", address: "Marseille", latitude: 43.300000, longitude: 5.400000, global_rating: 1, avatar: "sacha-avatar.png")

puts "Creating cards..."

url = "https://api.pokemontcg.io/v2/cards?"
card_serialized = URI.open(url).read
cards = JSON.parse(card_serialized)

cards['data'].first(100).each do |data|
  card = Card.create!(name: data['name'], price: data['cardmarket']['prices']['trendPrice'], serie: data['set']['series'], extension: data['set']['name'], released_date: data['set']["releaseDate"], number: data['number'], rarity: data['rarity'], category: data['types'].first, image: data['images']['small'])
  puts "#{card['name']}"
end

puts "Creating user_cards ..."

UserCard.create!(user: remy, card: Card.first, exchangeable: true)
UserCard.create!(user: remy, card: Card.second, exchangeable: true)
UserCard.create!(user: remy, card: Card.fourth, exchangeable: true)

UserCard.create!(user: sacha, card: Card.first, exchangeable: true)
UserCard.create!(user: sacha, card: Card.third, exchangeable: false)
UserCard.create!(user: sacha, card: Card.fourth, exchangeable: true)

UserCard.create!(user: john, card: Card.first, exchangeable: true)
UserCard.create!(user: john, card: Card.second, exchangeable: true)
UserCard.create!(user: john, card: Card.third, exchangeable: false)


puts "Finished!"
