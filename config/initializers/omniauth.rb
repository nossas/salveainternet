Rails.application.config.middleware.use OmniAuth::Builder do
  # Scope is been managed in the JS function that opens the Facebook popup
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], display: 'popup', provider_ignores_state: true
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end

if Rails.env.test?
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    :provider => "twitter",
    :uid => "123456",
    :info => {
      :nickname => "johnqpublic",
      :name => "John Q Public",
      :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
    },
    :credentials => {
      :token => "a1b2c3d4...", # The OAuth 2.0 access token
      :secret => "abcdef1234"
    },
    :extra => {
      :access_token => "123", # An OAuth::AccessToken object
    }
  })

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    :provider => 'facebook',
    :uid => '1234567',
    :info => {
      :nickname => 'jbloggs',
      :email => 'joe@bloggs.com',
      :first_name => 'Joe',
      :last_name => 'Bloggs',
      :image => 'http://graph.facebook.com/1234567/picture?type=square',
    },
    :credentials => {
      :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
      :expires_at => 1321747205, # when the access token expires (it always will)
      :expires => true # this will always be true
    }
  })
end
