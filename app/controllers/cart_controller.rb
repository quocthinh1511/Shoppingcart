class CartController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def show 
    @order_items = current_order.order_items
    #@order.update(order_params)
    #current_order.shipping_id = @order.shipping_id
  end
  private 
  def logged_in_user
    unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
end 
end
