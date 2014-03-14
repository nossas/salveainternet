class Authorization < ActiveRecord::Base
  validates :provider, :uid, :first_name, :last_name, :token, :expires_at, presence: true
  validates :uid, uniqueness: { scope: :provider }

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
