class CreateDealDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :deal_details do |t|

      t.timestamps
    end
  end
end
