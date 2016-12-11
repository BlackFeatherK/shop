class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
    	t.integer :product_id , :index => true
    	t.integer :order_id , :index => true
    	t.integer :cart_id , :index => true
    	t.integer :qty
    	t.integer :amout
    	
      t.timestamps
    end
  end
end
