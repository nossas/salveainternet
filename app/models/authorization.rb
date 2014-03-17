class Authorization < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::AssetTagHelper

  validates :provider, :uid, :first_name, :last_name, :token, :expires_at, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def renew_token!
    new_token = Koala::Facebook::OAuth.new(ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"]).exchange_access_token_info(self.token)
    self.token = new_token['access_token']
    self.expires_at = Time.now + new_token['expires'].to_i.seconds
    self.save
  end

  def share
    api = Koala::Facebook::API.new(self.token)
    api.put_wall_post(
      nil, 
      link: root_url(anchor: "compartilhaco"),
      name: "Ele foi presidente da Telerj durante o governo Collor, controla 7 rádios, e é parte em 22 processos no Supremo. Agora, ele está ajudando as teles a acabar com a sua liberdade na Internet.",
      description: "O voto que define o futuro da Internet será em 4 horas. Você vai deixar o Eduardo Cunha ganhar sem dizer nada?",
      picture: image_url("compartilhaco.jpg")
    )
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
