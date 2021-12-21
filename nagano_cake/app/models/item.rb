class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items

  attachment :image
  
  def price_tax
    (price * 1.1).floor
  end

end
