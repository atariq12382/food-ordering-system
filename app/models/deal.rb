class Deal < ApplicationRecord
  belongs_to :restaurant,  class_name: "Restaurant", foreign_key: "restaurant_id"

  has_many :deal_details, class_name: "DealDetail", foreign_key: "deal_id"
  has_many :deal_menu_items, through: :deal_details
end
