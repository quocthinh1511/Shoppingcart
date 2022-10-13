class OrderItemsController < ApplicationController  

 
    def create
      @order = current_order
      @order_item = @order.order_items.new(order_item_params)
      @product = Product.find_by(id: @order_item.product_id)
      @order.user_id = session[:user_id]
      if @product.quantity < @order_item.quantity 
        flash[:danger] = 'Your quantity must be smaller than product'
        redirect_to root_path
      else
        if @order.save
      #session[:order_id] = @order.id
          redirect_to root_path
          flash[:success]= 'Your item added!'
        end
      end
    end
  
      def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update(order_item_params)
        @order_items = @order.order_items
        redirect_to cart_path
      end
  
      def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = @order.order_items
        redirect_to cart_path
      end

    private
      def order_item_params
        params.require(:order_item).permit(:quantity,:product_id)
      end
end