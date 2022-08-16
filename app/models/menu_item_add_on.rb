class MenuItemAddOn < ApplicationRecord
  belongs_to :menu_item,  class_name: "MenuItem", foreign_key: "menu_items_id"
  belongs_to :add_on,  class_name: "AddOn", foreign_key: "add_ons_id"
end
