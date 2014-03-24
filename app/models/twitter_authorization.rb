class TwitterAuthorization < ActiveRecord::Base
  def tweet!
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = self.token
      config.access_token_secret = self.secret
    end
    tweet = client.update(I18n.t("compartilhaco.twitter.message_#{rand(5) + 1}"))
    self.update_attribute :tweet_id, tweet.id
  end
end
