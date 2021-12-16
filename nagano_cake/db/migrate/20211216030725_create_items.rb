class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name
      t.string :image_id
      t.text :description
      t.integer :price
      t.boolean :is_status, default: false, null: false
      t.timestamps
    end
  end
end
