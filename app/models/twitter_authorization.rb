class TwitterAuthorization < ActiveRecord::Base
  def tweet!
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = t.token
      config.access_token_secret = t.secret
    end
    tweet = client.update("I'm tweeting with @gem!")
    self.update_attribute :tweet_id, tweet.id
  end
end
