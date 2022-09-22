class CartItemsController < ApplicationController
    def index
      @products = Product.where(shop_id: current_shop.id)
      @cart_items = CartItem.where(product_id: @products.ids)
    end
    def index_user 
        @product = Product.find_by(id: params[:id])
        @cart_sesisons = CartSession.where(user_id: session[:user_id])
        @cart_items = CartItem.where(cart_session_id: @cart_sesisons.ids)
    end
    def update 
        @cart_item = CartItem.find_by(id: params[:id])
          if @cart_item.update(cart_item_params)
              # Handle a successful update.
             redirect_to cart_items_path
          else
              flash[:danger] = "Failed"
          end
    end
    def destroy
      CartItem.find(params[:id]).destroy
      flash[:success] = "Order deleted"
      redirect_to cart_items_path
    end
    private
    def cart_item_params    
        params.require(:cart_item).permit(:order_status)
      end
    end