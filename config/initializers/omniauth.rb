Rails.application.config.middleware.use OmniAuth::Builder do
  # Scope is been managed in the JS function that opens the Facebook popup
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], display: 'popup', provider_ignores_state: true
end
