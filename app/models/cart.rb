class Cart < ApplicationRecord

	has_many :line_items , :dependent => :destroy

	def total_qty
		self.line_items.map{ |x| x.qty }.sum
	end

	def amount
		self.line_items.map{ |x| x.price * x.qty }.sum
	end

	def add_product(product)
		existing_line_item = self.line_items.find_by( :product_id => product.id)
		if existing_line_item
			existing_line_item.qty +=1
			existion_line_item.save!
		else
			self.line_items.create!( :product => product ,
									 :qty => 1 ,
									 :price => product.price
									 )
		end
	end	

	def remove_product(product)
		existing_line_item = self.line_items.find_by( :product_id => product.id)
		existing_line_item.destroy
	end

end
