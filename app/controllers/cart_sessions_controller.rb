class CartSessionsController < ApplicationController

    def index
      @shop = current_shop
      @cart_sessions = CartSession.find_by(user_id: @shop.user_id)
    
    end
    def delete 

    end
  end
  