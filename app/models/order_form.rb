class OrderForm
  include ActiveModel::Model
  attr_accessor  :user_id, :item_id, :send_origin_id

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :send_origin_id, presence: true


  def save
    if valid?
      order = Order.create(user_id: user_id, item_id: item_id)

      shipping_address = ShippingAddress.create(order_id: order.id, send_origin_id: send_origin_id)
      return true
    else
      return false
    end
  end
end