class StaticPagesController < ApplicationController
    def home
        if logged_in?
            @micropost = current_user.microposts.build
            @feed_items = current_user.feed.paginate(page: params[:page])
          end 
        @products = Product.where(sale: true)  
    end
  
    def help
    end
    
    def about
    end
    include SessionsHelper
    include ShoppersHelper
    
  end
  
  
  