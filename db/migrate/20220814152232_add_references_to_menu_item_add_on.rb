class AddReferencesToMenuItemAddOn < ActiveRecord::Migration[6.1]
  def change
    add_reference :menu_item_add_ons, :menu_items, index: true
    add_reference :menu_item_add_ons, :add_ons, index: true
  end
end
