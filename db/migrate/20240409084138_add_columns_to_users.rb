class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :number, :string
    add_column :users, :address, :string
    add_column :users, :image, :string
    add_column :users, :is_admin, :boolean, default: false, null: false
  end
end
