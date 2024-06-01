class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :size
      t.string :color
      t.integer :gender
      t.string :image

      t.timestamps
    end
  end
end
