class CartController < ApplicationController

  def show 
    @order = current_order
    @order_items = current_order.order_items
    #@order.update(order_params)
    #current_order.shipping_id = @order.shipping_id
  end

  private

end
