class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
