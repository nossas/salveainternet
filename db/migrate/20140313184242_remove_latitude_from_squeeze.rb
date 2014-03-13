class RemoveLatitudeFromSqueeze < ActiveRecord::Migration
  def change
    remove_column :squeezes, :latitude, :string
  end
end
