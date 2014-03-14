class AddEmailToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :email, :string
  end
end
