class DealDetail < ApplicationRecord
  belongs_to :deal,  class_name: "Deal", foreign_key: "deal_id"
  belongs_to :deal_menu_item,  class_name: "DealMenuItem", foreign_key: "deal_menu_item_id"
end
