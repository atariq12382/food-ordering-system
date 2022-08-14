class AddDealAndDealMenuItemToDealDetail < ActiveRecord::Migration[6.1]
  def change
    add_reference :deal_details, :deal, index: true
    add_reference :deal_details, :deal_menu_item, index: true
  end
end
