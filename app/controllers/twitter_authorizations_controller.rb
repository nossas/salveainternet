class TwitterAuthorizationsController < ApplicationController
  def create
    auth = env["omniauth.auth"]

    twitter_authorization = TwitterAuthorization.where(uid: auth[:uid]).first_or_initialize.tap do |twitter_authorization|
      twitter_authorization.uid = auth[:uid]
      twitter_authorization.name = auth[:info][:name]
      twitter_authorization.image = auth[:info][:image]
      twitter_authorization.token = auth[:credentials][:token]
      twitter_authorization.save
    end

    session[:twitter_authorization_id] = twitter_authorization.id
    redirect_to root_url(anchor: "compartilhaco")
  end
end
