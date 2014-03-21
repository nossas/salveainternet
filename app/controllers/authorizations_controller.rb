class AuthorizationsController < ApplicationController
  def create
    authorization = Authorization.from_omniauth(env["omniauth.auth"])
    session[:facebook_authorization_id] = authorization.id
    redirect_to root_url(anchor: "compartilhaco")
  end
end
