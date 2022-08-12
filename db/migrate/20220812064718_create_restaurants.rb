class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :owner
      t.decimal :perCut
      t.time :openingHours
      t.time :closingHours
      t.string :status

      t.timestamps
    end
  end
end
