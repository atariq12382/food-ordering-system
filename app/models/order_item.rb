class OrderItem < ApplicationRecord
  belongs_to :item, polymorphic: true

  belongs_to :order, class_name: "Order", foreign_key: "order_id"
end
