class AddCityToSqueeze < ActiveRecord::Migration
  def change
    add_column :squeezes, :city, :string
  end
end
