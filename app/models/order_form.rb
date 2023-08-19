class OrderForm
  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :send_origin_id , :city, :street_address, :building, :phone_number, :user_id, :item_id, :token

  validates :card_number, presence: true
  validates :card_exp_month, presence: true
  validates :card_exp_year, presence: true
  validates :card_cvc, presence: true
  validates :postal_code, presence: true
  validates :send_origin_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true


  def save
    if valid?
      order = Order.create(user_id: user_id, item_id: item_id)
      shipping_address = ShippingAddress.create(postal_code: postal_code, send_origin_id: send_origin_id, city: city, street_address: street_address,phone_number: phone_number)
      return true
    else
      return false
    end
  end
end