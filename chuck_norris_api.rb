# Use HTTParty to get random Chuck Norris joke
require "httparty"
response = HTTParty.get("https://api.icndb.com/jokes/random?")
# response = HTTParty.get("http://api.icndb.com/categories")

# Convert the response into a hash
require "json"
ruby = JSON.parse(response.body)

# p ruby
# Print the joke to the console
p ruby["value"]["joke"]
