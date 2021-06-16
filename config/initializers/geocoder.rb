Geocoder.configure(
  # Geocoding options
  timeout: 5,                 # geocoding service timeout (secs)
  lookup: :google,         # name of geocoding service (symbol)
  api_key: ENV['Geocoder_API_Key'],               # API key for geocoding service
  units: :km,                 # :km for kilometers or :mi for miles
)