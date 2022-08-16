class Option < ApplicationRecord
  belongs_to :menu_item,  class_name: "MenuItem", foreign_key: "menu_item_id"

  has_many :items, as: :item
end
