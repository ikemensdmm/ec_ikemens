class Address < ApplicationRecord

  belongs_to :customer

  validates :customer_id, :receiver_name, :address,  presence: true
  validates :post_code, length: {is: 7}, numericality: { only_integer: true }

end