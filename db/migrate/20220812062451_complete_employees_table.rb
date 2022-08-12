class CompleteEmployeesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :name, :string
    add_column :employees, :cnic, :string
    add_column :employees, :address, :string
    add_column :employees, :salary, :integer
    add_column :employees, :contact, :string
  end
end
