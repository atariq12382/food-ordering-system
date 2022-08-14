class AddMenuItemToOption < ActiveRecord::Migration[6.1]
  def change
    add_reference :options, :menu_item, index: true
  end
end
