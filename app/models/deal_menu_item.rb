class DealMenuItem < ApplicationRecord
  has_many :deal_details, class_name: "DealDetail", foreign_key: "deal_menu_item_id"
  has_many :deals, through: :deal_details

  has_many :items, as: :item
  has_one_attached :image
end
