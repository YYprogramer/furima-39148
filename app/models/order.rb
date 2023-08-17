class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address
  attr_accessor :token

  validates :user, :item, :shipping_address ,:token, presence: true
end
