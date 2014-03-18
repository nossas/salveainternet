class AddLastTokenRenewToAuthorization < ActiveRecord::Migration
  def change
    add_column :authorizations, :last_token_renew, :boolean
  end
end
