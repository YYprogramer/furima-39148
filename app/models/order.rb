class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

  validates :user_id, :item_id, :shipping_address , presence: true
end
