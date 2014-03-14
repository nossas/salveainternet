class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :token, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
