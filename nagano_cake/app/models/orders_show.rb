class OrdersShow < ApplicationRecord
  
  belongs_to :order
	belongs_to :item
  
  enum status: { impossible: 0, waiting: 1 , making: 2, preparation: 3}
  
end
