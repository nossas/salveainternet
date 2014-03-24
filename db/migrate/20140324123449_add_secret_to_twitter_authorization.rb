class AddSecretToTwitterAuthorization < ActiveRecord::Migration
  def change
    add_column :twitter_authorizations, :secret, :string, null: false, default: "update me"
  end
end
