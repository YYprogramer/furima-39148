class OrdersController < ApplicationController
  before_action :redirect_unauthenticated_user,:redirect_own_item, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
    if user_signed_in? && @item.user != current_user && @item.sold_out?
      redirect_to root_path
    end
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

    def redirect_own_item
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user == @item.user
      redirect_to root_path
    end
  end

  def redirect_unauthenticated_user
    @item = Item.find(params[:item_id])
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def order_params
    params.require(:order_form).permit(:number_form, :expiry_form, :cvc_form,:postal_code, :send_origin_id, :city, :street_address, :building, :phone_number, :order_id, :user_id, :item_id, :token, :price)
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
