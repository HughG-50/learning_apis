require 'HTTParty'

# Makes get request to the wikipedia page resource
response = HTTParty.get("https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol")

p response.body