class Authorization < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::AssetTagHelper

  validates :provider, :uid, :first_name, :last_name, :token, :expires_at, presence: true
  validates :uid, uniqueness: { scope: :provider }

  has_and_belongs_to_many :friends, -> { uniq }

  def renew_token!
    begin
      new_token = Koala::Facebook::OAuth.new(ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"]).exchange_access_token_info(self.token)
      self.token = new_token['access_token']
      self.expires_at = Time.now + new_token['expires'].to_i.seconds
      self.last_token_renew = true
      self.save
    rescue Exception => e
      logger.error "Could not renew token for authorization id #{self.id}"
      self.last_token_renew = false
      self.save
    end
  end

  def share
    post = api.put_wall_post(
      I18n.t("squeeze.new.compartilhaco.post.message"), 
      link: "http://bit.ly/salveainternet",
      name: I18n.t("squeeze.new.compartilhaco.post.header"),
      description: I18n.t("squeeze.new.compartilhaco.post.lead"),
      picture: "http://i.imgur.com/f7E6cKM.jpg"
    )
    self.update_attribute :facebook_post_id, post["id"]
  end

  def load_friends!
    friends = api.get_connections("me", "friends", fields: "first_name, last_name, picture")
    friends.each do |f|
      self.friends << Friend.where(uid: f["id"]).first_or_create(
        uid: f["id"], 
        first_name: f["first_name"], 
        last_name: f["last_name"], 
        picture: f["picture"]["data"]["url"]
      )
    end    
    self.update_attribute :loaded_friends_at, Time.now
  end

  def api
    @api ||= Koala::Facebook::API.new(self.token)
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |authorization|
      authorization.provider = auth.provider
      authorization.uid = auth.uid
      authorization.first_name = auth.info.first_name
      authorization.last_name = auth.info.last_name
      authorization.email = auth.info.email
      authorization.token = auth.credentials.token
      authorization.expires_at = Time.at(auth.credentials.expires_at)
      authorization.save!
    end
  end
end
