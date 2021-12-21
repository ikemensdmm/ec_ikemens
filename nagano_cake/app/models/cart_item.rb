class CartItem < ApplicationRecord
  
  def subtotal
    item.price_tax * quantity
  end

  belongs_to :item
  belongs_to :customer

end