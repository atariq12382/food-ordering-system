class AddManagerToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_reference :restaurants, :manager, index: true
  end
end
