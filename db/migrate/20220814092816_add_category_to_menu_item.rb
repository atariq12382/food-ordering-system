class AddCategoryToMenuItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :menu_items, :category, index: true
  end
end
