require 'HTTParty'

pokemon_choice = "Charizard".downcase

#  Makes get request to the pokemon API
response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/" + pokemon_choice)

# Convert the response into a hash
require "json"
ruby = JSON.parse(response.body)

# p response.body

p ruby["species"]["name"].capitalize
p ruby["base_experience"]
p ruby["types"][0]["type"]["name"].capitalize
p ruby["types"][1]["type"]["name"].capitalize