class AddLongitudeToSqueeze < ActiveRecord::Migration
  def change
    add_column :squeezes, :longitude, :string
  end
end
