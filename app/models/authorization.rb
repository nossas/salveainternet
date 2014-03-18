class Authorization < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::AssetTagHelper

  validates :provider, :uid, :first_name, :last_name, :token, :expires_at, presence: true
  validates :uid, uniqueness: { scope: :provider }

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
    api = Koala::Facebook::API.new(self.token)
    post = api.put_wall_post(
      nil, 
      link: root_url,
      name: "Réu em 3 processos no STF, aliado das teles e inimigo da internet",
      description: "O voto que define o futuro da Internet será em 4 horas. Você vai deixar o Eduardo Cunha ganhar sem dizer nada?",
      picture: "http://i.imgur.com/H4v4xr9.jpg"
    )
    self.update_attribute :facebook_post_id, post["id"]
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
