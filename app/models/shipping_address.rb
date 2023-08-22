class ShippingAddress < ApplicationRecord
  belongs_to :order
  belongs_to :send_origin

  validates :order, :postal_code,:send_origin_id, :city, :street_address, :phone_number, presence: true
end
