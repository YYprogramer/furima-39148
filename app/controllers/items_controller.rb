class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :condition_id, :send_cost_id, :send_origin_id, :send_time_id, :price, :name, :description)
  end
end
