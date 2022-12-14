class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :set_shipping
  def new
  end
  def index 
  end
  def create 
    @order = current_order
  end
  def destroy 

  end
  def update 
    @order = current_order
    @order.update(order_params)
    current_order.shipping_id = @order.shipping_id
    redirect_to cart_path
  end
  
  def checkout
    @user = current_user
    @order = current_order
    @order.user_id = session[:user_id]
    @cart_session = CartSession.new(session_param(@order))
    @all_items = @order.order_items

    if check(@all_items) == true
    
      if @cart_session.save
      # Send mail for order
        @user.send_order_email
        @order.order_items.each do |order_item|
        # Copy CartItem to OrderItem
     
          CartItem.create(newAtrs(@cart_session,order_item))
      # Mail for shop
          Shop.all.each do |i|
            if i.name == order_item.product.shop.name
            i.send_shop_email
            end
          end
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
    else 
      flash[:danger] = 'Quantity Error, Please add again!'
      redirect_to root_path
    end
  end

    def check(order_item)
      @order = current_order
      for i in (0...order_item.size)
        @product = Product.find_by(id: order_item[i].product_id)
        all = order_item[i].quantity
        for j in (i+1...order_item.size)
            if order_item[i].product_id == order_item[j].product_id
              all+= order_item[j].quantity
            end
        end
          if all > @product.quantity
            return false
          end
      end
        return true 
    end
    
  private
  def order_params    
    params.require(:order).permit(:shipping_id, :voucher)
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
  def set_shipping
    @shipping= Shipping.all.order(:name)
  end
  def session_param(params)
    {
      user_id: params.user_id,
      sum: params.sum
    }
  end
end