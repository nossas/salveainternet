class AddEmailToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :email, :string, null: false
  end
end
