class AddOn < ApplicationRecord
  has_many :menu_item_add_ons, class_name: "MenuItemAddOn", foreign_key: "add_ons_id"
  has_many :menu_items, through: :menu_item_add_ons

  has_many :items, as: :item
end
