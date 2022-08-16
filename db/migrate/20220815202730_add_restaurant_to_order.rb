class AddRestaurantToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :restaurant, index: true
  end
end
