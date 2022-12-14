class ShopsController < ApplicationController    
    before_action :logged_in_user, only: [:create, :destroy]
    
    def show 
        @shop = Shop.find_by(id: current_shop.id)
        @products = @shop.products
    end

    def show_to_product
        @shop = Shop.find_by(id: params[:id])
        @products = @shop.products
    end

    def new
        @shop = Shop.new
    end 

    def index
      @shop = Shop.find_by(id: params[:id])
      @shops = Shop.all
    end

    def create
        @shop = Shop.new(shop_params) 
        @user = User.find_by(id: session[:user_id])
        @shop.user_id = session[:user_id]
        if @shop.save
            @user.update_attribute(:role, 2)
            flash[:success] = 'Create shop successfully!'
            redirect_to root_path 
        else
            flash[:warning] = "Cannot create shop!!"
            render 'shops/new'
        end
    end

    def edit
        @shop = Shop.find_by(id: params[:id]) 
    end

    def update
        @shop = Shop.find_by(id: params[:id])
        if @shop.update(shop_params)
            # Handle a successful update.
            flash[:success] = 'Update shop successfully'
            redirect_to root_path
        else
            redirect_to @shop
        end
    end

    def destroy
        Shop.find(params[:id]).destroy
        flash[:success] = " Shop deleted"
        redirect_to shops_url
    end
   
    private

        def shop_params
            params.require(:shop).permit(:name, :description, :phone ,:tax_code, :avatar)
        end

        def logged_in_user
            unless logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_url
            end
        end 
end
