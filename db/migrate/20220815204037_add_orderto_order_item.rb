class AddOrdertoOrderItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_items, :order, index: true
  end
end
