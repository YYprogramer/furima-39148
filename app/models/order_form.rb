class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :send_origin_id , :city, :street_address, :building, :phone_number, :user_id, :item_id, :token

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "Please enter in the format of '3-digit hyphen 4-digit'" }, presence: true
  validates :send_origin_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Please enter a 10 to 11 digit numeric value." }, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true


  def save(user_id:,item_id:)
    if valid?
        order = Order.create(user_id: user_id, item_id: item_id)
        shipping_address = ShippingAddress.create(
          postal_code: postal_code, 
          send_origin_id: send_origin_id,
          city: city, 
          street_address: street_address, 
          building: building, 
          phone_number: phone_number, 
          order_id: order.id)
      true
    else
      false
    end
  end
end