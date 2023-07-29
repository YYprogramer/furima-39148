class FurimasController < ApplicationController
  def index
    render 'items/index'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
