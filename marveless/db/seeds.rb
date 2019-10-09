# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'JSON'

all_characters = RestClient.get("http://gateway.marvel.com/v1/public/characters?ts=1&apikey=50265fe0032e30bc7011bf3ef16ffd9b&hash=d4e5c40fc9d222d34bfdbf5ed7858ade")

character_hash = JSON.parse(all_characters)["data"]["results"]

character_hash.each do |character|
  puts character["thumbnail"]["path"]
  Character.create(
  name: character["name"],
  description: character["description"], 
  image:  character["thumbnail"]["path"] +"/portrait_fantastic."+ character["thumbnail"]["extension"],  
  comics: character["comics"]["collectionURI"], 
  events: character["events"] 
  )
end

