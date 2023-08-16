class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @order_form = OrderFprm.new
  end

  def create
    @item = Item.find(params[:id])
    @order_form = OrderFprm.new(order_params)
    if @order_form.valid?
      redirect_to item_path(@item)
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:user_id, :item_id)
  end
end
