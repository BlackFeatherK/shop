class Product < ApplicationRecord
	validates_presence_of :name , :price , :stock_qty
end
