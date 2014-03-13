class AddLatitudeToSqueeze < ActiveRecord::Migration
  def change
    add_column :squeezes, :latitude, :string
  end
end
