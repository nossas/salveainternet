require 'spec_helper'

describe Authorization do
  before { Authorization.create! provider: "facebook", uid: "1", first_name: "Nícolas", last_name: "Iensen", token: "123", expires_at: Time.now + 1.year }

  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :token }
  it { should validate_presence_of :expires_at }
  it { should validate_uniqueness_of(:uid).scoped_to :provider }
end
