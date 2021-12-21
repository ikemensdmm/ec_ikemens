class Order < ApplicationRecord
  
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirmation: 1 , making: 2, preparation: 3, completion: 4}
      
end
