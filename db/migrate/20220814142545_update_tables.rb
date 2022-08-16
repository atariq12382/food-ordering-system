class UpdateTables < ActiveRecord::Migration[6.1]
  def change
    add_column :deals, :price, :integer
    remove_column :deal_menu_items, :price, :integer
  end
end
