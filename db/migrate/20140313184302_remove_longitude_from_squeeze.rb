class RemoveLongitudeFromSqueeze < ActiveRecord::Migration
  def change
    remove_column :squeezes, :longitude, :string
  end
end
