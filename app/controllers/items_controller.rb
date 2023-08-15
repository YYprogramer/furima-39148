class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :condition_id, :send_cost_id, :send_origin_id, :send_time_id, :price, :name, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
