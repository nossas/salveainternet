if Rails.env.test?
  Geocoder.configure(:lookup => :test)

  Geocoder::Lookup::Test.add_stub(
    [0.0, 0.0], [
      {
        'latitude'     => 40.7143528,
        'longitude'    => -74.0059731,
        'address'      => 'New York, NY, USA',
        'state'        => 'New York',
        'state_code'   => 'NY',
        'country'      => 'United States',
        'country_code' => 'US'
      }
    ]
  )
else
  Geocoder.configure(
    # geocoding service (see below for supported options):
    :lookup => :yandex,

    # IP address geocoding service (see below for supported options):
    :ip_lookup => :freegeoip,

    # to use an API key:
    # :api_key => "...",

    # geocoding service request timeout, in seconds (default 3):
    :timeout => 5,

    # set default units to kilometers:
    :units => :km

    # caching (see below for details):
    # :cache => Redis.new,
    # :cache_prefix => "..."
  )
end
