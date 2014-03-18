class AddFacebookPostIdToAuthorization < ActiveRecord::Migration
  def change
    add_column :authorizations, :facebook_post_id, :string, foreign_key: false
  end
end
