if Rails.env.production? || Rails.env.staging?
  raise "MAILCHIMP_LIST_ID is missing" if ENV["MAILCHIMP_LIST_ID"].nil?
  raise "MAILCHIMP_API_KEY is missing" if ENV["MAILCHIMP_API_KEY"].nil?
  raise "MAILCHIMP_SEGMENT_ID is missing" if ENV["MAILCHIMP_SEGMENT_ID"].nil?
  raise "FACEBOOK_KEY is missing" if ENV["FACEBOOK_KEY"].nil?
  raise "FACEBOOK_SECRET is missing" if ENV["FACEBOOK_SECRET"].nil?
  raise "TWITTER_KEY is missing" if ENV["TWITTER_KEY"].nil?
  raise "TWITTER_SECRET is missing" if ENV["TWITTER_SECRET"].nil?
end
