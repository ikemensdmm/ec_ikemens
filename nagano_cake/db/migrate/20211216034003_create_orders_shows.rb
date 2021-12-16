class CreateOrdersShows < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_shows do |t|

      t.integer :price_tax
      t.integer :quantity
      t.integer :production_status
      t.timestamps
    end
  end
end
