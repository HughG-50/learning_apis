# Simple program to test the querying on the CMC sandbox API using HTTParty
# Good exercise to get used to working with APIs and 

require 'httparty'

require_relative 'cmc_sandbox_API_key.rb'

# Live production endpoint
# url = 'https://pro-api.coinmarketcap.com/quotes/latest'
# Sandbox testing endpoint
url = 'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest'

currency_symbol = 'BTC'
request = HTTParty.get(url, :query => { :symbol => currency_symbol }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': API_KEY })
response = JSON.parse(request.body)
# response = JSON.parse(request.body)['data'][currency_symbol]['quote']['USD']['price']
# p response

# EXAMPLES - CAN PASS CMC API an ID, SYMBOL or SLUG Query Param
# request = HTTParty.get(url, :query => { :symbol => "BTC" }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': API_KEY })
# request = HTTParty.get(url, :query => { :slug => "bitcoin" }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': API_KEY })
# request = HTTParty.get(url, :query => { :id => 0 }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': API_KEY })

# Getting relevant information fieldss
p response['data'][currency_symbol]['name']
p response['data'][currency_symbol]['symbol']
p response['data'][currency_symbol]['max_supply']
p response['data'][currency_symbol]['cmc_rank']
p response['data'][currency_symbol]['quote']['USD']['price']

# request = HTTParty.get(url = self.slug)
# request = HTTParty.get(url = self.symbol)

# Sending API Key in header example
# @tests = HTTParty.get('https://io.adafruit.com/api/v2/username/myfeed/test/data', :headers => { 'content-type': 'application/json', 'X-AIO-Key': 'yourkey' })
# Sending API Key as query parameter example
# @tests = HTTParty.get('https://io.adafruit.com/api/v2/username/myfeed/test/data', {:headers => { 'content-type': 'application/json'}, :query => {'X-AIO-Key': 'yourkey' }})