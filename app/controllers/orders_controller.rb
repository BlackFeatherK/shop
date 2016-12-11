class OrdersController < ApplicationController

	before_action :authenticate_user!

	def index
		@orders = current_user.orders
	end

	def new
		@order = Order.new
	end


	def create
	    @order = Order.new( order_params )

	    @order.add_products_by_cart(current_cart)

	    if @order.save
	      current_cart.destroy
	      session[:cart_id] = nil

	      redirect_to root_path
	    else
	      render :new
	    end
	  end


	protected

	def order_params
		params.require(:order).permit(:receiver_name , :email , :cellphone , :address)
	end

end
