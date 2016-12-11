namespace :dev do
	
	task :fake => :environment do 
		puts "Generate development data!"

		100.times do 
			Product.create!( :name => Faker::Commerce.product_name,
							 :price => Faker::Commerce.price * 100,
							 :stock_qty => rand(100),
							 :description => Faker::Lorem.paragraph,
							 :image_url => Faker::Avatar.image
							)
		end

	end

end