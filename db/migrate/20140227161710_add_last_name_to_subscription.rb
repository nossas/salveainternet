class AddLastNameToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :last_name, :string, null: false
  end
end
