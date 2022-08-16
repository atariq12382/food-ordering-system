class AddRestaurantToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :restaurant, index: true
  end
end
