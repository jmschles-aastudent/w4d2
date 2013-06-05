require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
	:scheme => 'http',
	:host => 'localhost',
	:port => 3000,
	:path => '/contacts.json',
	:query_values => {
		:id => 3
	}).to_s

p RestClient.get(url)