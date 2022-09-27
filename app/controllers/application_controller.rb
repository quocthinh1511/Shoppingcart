class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
    helper_method :current_order
    def hello
        render html: "hello, world!"
    end

    def current_order
      return if session[:user_id].blank?

      Order.find_or_create_by(user_id: session[:user_id])
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
