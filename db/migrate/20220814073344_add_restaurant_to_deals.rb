class AddRestaurantToDeals < ActiveRecord::Migration[6.1]
  def change
    add_reference :deals, :restaurant, index: true
  end
end
