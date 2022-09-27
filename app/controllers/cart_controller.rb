class CartController < ApplicationController

  def show
    @order = current_order
    @order_items = current_order.order_items
  end

  def update_shipping_type
  end

  private

end
