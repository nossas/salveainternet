class Squeeze < ActiveRecord::Base
  after_create { SqueezeMailer.delay.dont_let_them_limit_our_access_to_the_internet(self) }
  after_create { SqueezeMailer.delay.you_cant_negotiate_the_neutrality_of_the_internet(self) }
end
