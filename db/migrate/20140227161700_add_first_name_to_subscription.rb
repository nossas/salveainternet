class AddFirstNameToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :first_name, :string, null: false
  end
end
