class CreateAddOns < ActiveRecord::Migration[6.1]
  def change
    create_table :add_ons do |t|
      t.string :name
      t.integer :price
      t.string :status
      
      t.timestamps
    end
  end
end
