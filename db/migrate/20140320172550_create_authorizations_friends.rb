class CreateAuthorizationsFriends < ActiveRecord::Migration
  def change
    create_table :authorizations_friends do |t|
      t.integer :authorization_id
      t.integer :friend_id
    end
  end
end
