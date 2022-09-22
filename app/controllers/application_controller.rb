class ApplicationController < ActionController::Base   
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
    helper_method :current_order
    def hello
        render html: "hello, world!"
    end
    def current_order
      if !Order.find_by(user_id: session[:user_id]).nil?
        Order.find_by(user_id: session[:user_id])
      else
        Order.new
      end
    end
    include SessionsHelper
    include ShoppersHelper
    private 
    #def initialize_session 
       # session[:cart]||= []
   # end
    #def load_cart 
      #  @cart = Product.find(session[:cart])
   # end
    
end
