# Simple program to test the querying on the CMC sandbox API using HTTParty
# Good exercise to get used to working with APIs and 

require 'httparty'

require_relative 'cmc_sandbox_API_key.rb'

# Live production endpoint
# url = 'https://pro-api.coinmarketcap.com/quotes/latest'
# Sandbox testing endpoint
url = 'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest'

request = HTTParty.get(url, :query => { :symbol => "BTC" }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': API_KEY })
# request = HTTParty.get(url, :query => { :slug => "bitcoin" }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': API_KEY })
# request = HTTParty.get(url, :query => { :id => 0 }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': API_KEY })

response = JSON.parse(request.body)
# p response

# Test line
symbol = 'BTC'
# Getting relevant information fieldss
p response['data'][symbol]['name']
p response['data']['BTC']['symbol']
p response['data']['BTC']['max_supply']
p response['data']['BTC']['cmc_rank']
p response['data']['BTC']['quote']['USD']['price']


# request = HTTParty.get(url = self.slug)
# request = HTTParty.get(url = self.symbol)


# Sending API Key in header example
# @tests = HTTParty.get('https://io.adafruit.com/api/v2/username/myfeed/test/data', :headers => { 'content-type': 'application/json', 'X-AIO-Key': 'yourkey' })
# Sending API Key as query parameter example
# @tests = HTTParty.get('https://io.adafruit.com/api/v2/username/myfeed/test/data', {:headers => { 'content-type': 'application/json'}, :query => {'X-AIO-Key': 'yourkey' }})