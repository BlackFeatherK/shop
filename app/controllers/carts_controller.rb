class CartsController < ApplicationController

	def add_product
		@product = Product.find(params[:product_id])

		current_cart.add_product(@product)

		flash[:notice] = "加入購物車"
		respond_to do |format|
			format.js
			format.html {redirect_to :back}
		end
		
	end

	def remove_product
		@product = Product.find(params[:product_id])

		current_cart.remove_product(@product)

		redirect_to :back
	end
end
