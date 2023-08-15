class ShippingAddress < ApplicationRecord
  belongs_to :order
  belongs_to :send_origin

  validates :order,presence: true
  validates :send_origin_id, numericality: { other_than: 1 , message: "can't be blank"}
end
