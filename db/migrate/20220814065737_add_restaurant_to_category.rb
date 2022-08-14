class AddRestaurantToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :restaurant, index: true
  end
end
