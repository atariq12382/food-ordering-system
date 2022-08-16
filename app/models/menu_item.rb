class MenuItem < ApplicationRecord
  belongs_to :category,  class_name: "Category", foreign_key: "category_id"

  has_many :menu_item_add_ons, class_name: "MenuItemAddOn", foreign_key: "menu_items_id"
  has_many :add_ons, through: :menu_item_add_ons

  has_many :options, class_name: "Option", foreign_key: "menu_item_id"

  has_many :promos, class_name: "Promo", foreign_key: "menu_item_id"

  has_many :items, as: :item
end
