class ChangeDatatypeSizeColorOfItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :size, :integer
    change_column :items, :color, :integer
  end
end
