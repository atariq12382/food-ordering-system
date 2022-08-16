class AddManager < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :manager, index: true
  end
end
