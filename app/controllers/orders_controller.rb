class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def new
    @Order = Order.new
  end
  def index 
    @orders = Order.all 
  end
  def destroy 

  end
  def create 
  # @order = current_user.orders.build(order_params)
  #  @cart_session.user_id = session[:user_id]
   # if @order.save
       # flash[:success] = 'Buy successfully'
        #redirect_to root_path
   # else
       # flash[:warning] = "Try to buy again!!"
       # render 'products/index'
    end
  def checkout
    @order = current_order
    @order.user_id = session[:user_id]
    @cart_session = CartSession.new(session_param(@order))
    if @cart_session.save
      @order.order_items.each do |order_item|
        # Copy CartItem to OrderItem
        CartItem.create(newAtrs(@cart_session,order_item))
        # Decrease quantity product
        Product.all.each do |product|
          if (product.name == order_item.product.name && order_item.quantity > 0 )
            number = product.quantity - order_item.quantity
            product.update_attribute(:quantity, number)
          end
        end
      end
      @order.destroy
      flash[:success] = "Order successfully"
      redirect_to root_path
    else 
      flash[:danger] = "Order fail"  
    end
    end
  private 
  def order_params    
    params.require(:order).permit(:sum, :user_id, :order_status_id)
  end
  def logged_in_user
    unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
  end

  def newAtrs(cart_session ,order_item)
    { 
      cart_session_id: cart_session.id,
      product_id: order_item.product_id,
      quantity: order_item.quantity,
      unit_price: order_item.unit_price, 
      total_price: order_item.total_price
    }
  end

  def session_param(params)
    {
      user_id: params.user_id,
      sum: params.sum
    }
  end
end