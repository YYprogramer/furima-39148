class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    @order_form.user_id = current_user.id
    @order_form.item_id = @item.id
    @order_form.token = params[:token]

    if @order_form.valid?
      pay_item
      order = @order_form.save(user_id: current_user.id, item_id: @item.id)
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def order_params
    params.require(:order_form).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc,:postal_code, :send_origin_id, :city, :street_address,:building, :phone_number, :user_id, :item_id, :token, :price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @order_form.token,
      currency: 'jpy'
    )
  end
end
