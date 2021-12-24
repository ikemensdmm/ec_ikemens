class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :shipping, default: 800
      t.integer :billing_amount
      t.integer :payment_method, default: 0
      t.string :post_code
      t.string :address
      t.string :name
      t.integer :status, default: 0
      t.integer :customer_id
      t.timestamps
    end
  end
end
