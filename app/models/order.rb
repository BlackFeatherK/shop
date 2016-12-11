class Order < ApplicationRecord
	belongs_to :user
	has_many :line_items , :dependent => :destroy

	def add_products_by_cart(cart)
		cart.line_items.each do |item| 
			self.line_items.build(  :product_id => item.product_id,
									:qty => item.qty,
									:price => item.price
									)
		end
		self.amount = cart.amount
	end

end
