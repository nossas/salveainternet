class AddLoadedFriendsAtToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :loaded_friends_at, :datetime
  end
end
