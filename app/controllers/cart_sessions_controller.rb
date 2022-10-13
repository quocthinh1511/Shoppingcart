class CartSessionsController < ApplicationController

    def index
      @shop = current_shop
      @cart_sessions = CartSession.all
    end
    def index_user 
      @cart_sessions = current_user.cart_sessions
    end
    def update 
      @cart_session = CartSession.find_by(id: params[:id])
        if @cart_session.update(cart_sesion_params)
            # Handle a successful update.
           redirect_to cart_sessions_path
        else
            flash[:danger] = "Failed"
        end
    end
    def destroy
      CartSession.find(params[:id]).destroy
      flash[:success] = "Order deleted"
      redirect_to cart_sessions_path
    end
    private
    def cart_sesion_params    
      params.require(:cart_session).permit(:order_status)
    end
  end
  