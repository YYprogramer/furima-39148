class ShippingAddress < ApplicationRecord
  belongs_to :order
  belongs_to :send_origin

  validates :order,presence: true
  validates :send_origin_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "Please enter in the format of '3-digit hyphen 4-digit'" }
end
