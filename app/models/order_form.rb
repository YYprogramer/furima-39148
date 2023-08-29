class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :send_origin_id , :city, :street_address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "Please enter in the format of '3-digit hyphen 4-digit'" }
    validates :send_origin_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Please enter a 10 to 11 digit numeric value." }
    validates :user_id
    validates :item_id
    validates :token
  end


  def save
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
    end
  end
end