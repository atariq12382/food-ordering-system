class Order < ApplicationRecord
  belongs_to :restaurant, class_name: "Restaurant", foreign_key: "restaurant_id"

  has_many :order_items, class_name: "OrderItem", foreign_key: 'order_id'
end
