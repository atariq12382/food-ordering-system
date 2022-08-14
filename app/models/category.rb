class Category < ApplicationRecord
  belongs_to :restaurant,  class_name: "Restaurant", foreign_key: "restaurant_id"

  has_many :menu_items, class_name: 'MenuItem', foreign_key: 'category_id'
end
