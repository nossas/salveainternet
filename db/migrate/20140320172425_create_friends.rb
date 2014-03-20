class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :uid
      t.string :picture

      t.timestamps
    end
  end
end
