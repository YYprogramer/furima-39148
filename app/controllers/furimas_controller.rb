class FurimasController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
    render 'items/index'
  end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to root_path
  # end
end
