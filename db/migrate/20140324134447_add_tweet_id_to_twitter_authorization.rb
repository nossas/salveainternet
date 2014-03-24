class AddTweetIdToTwitterAuthorization < ActiveRecord::Migration
  def change
    add_column :twitter_authorizations, :tweet_id, :string, foreign_key: false
  end
end
