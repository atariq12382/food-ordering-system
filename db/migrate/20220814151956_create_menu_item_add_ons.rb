class CreateMenuItemAddOns < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_item_add_ons do |t|

      t.timestamps
    end
  end
end
