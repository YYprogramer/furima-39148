class ShippingAddress < ApplicationRecord
  belongs_to :order
  belongs_to :send_origin

end
