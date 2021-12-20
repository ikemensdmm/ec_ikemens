class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.string :address
      t.string :post_code
      t.string :receiver_name
      t.integer :customer_id
      t.timestamps
    end
  end
end
