class CreateTwitterAuthorizations < ActiveRecord::Migration
  def change
    create_table :twitter_authorizations do |t|
      t.string :uid, null: false
      t.string :name, null: false
      t.string :image
      t.string :token, null: false

      t.timestamps
    end
  end
end
