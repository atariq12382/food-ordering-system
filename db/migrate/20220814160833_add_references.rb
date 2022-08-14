class AddReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :discounts, :restaurant, index: true
    add_reference :promos, :menu_item, index: true
  end
end
