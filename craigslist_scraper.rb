require 'open-uri'
require 'json'

# Set API token and URL
auth_token = {AUTH_TOKEN}
polling_url = "http://polling.3taps.com/poll"

params = {
  auth_token: auth_token,
  anchor: {ANCHOR}
}

uri = URI.parse(polling_url)
uri.query = URI.encode_www_form(params)

# Submit request
result = JSON.parse(open(uri).read)

# Display results to screen
puts JSON.pretty_generate result

params = {
  auth_token: auth_token,
  anchor: {ANCHOR},
  source: "CRAIG",
  category_group: "RRRR",
  category: "RHFR",
  'location.city' => "USA-NYM-BRL",
  retvals: "location,external_url,heading,body,timestamp,price,images,annotations"
}
