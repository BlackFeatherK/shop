class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :name
    	t.integer :price
    	t.integer :stock_qty
    	t.text :description
    	t.string :image_url
    	
      t.timestamps
    end
  end
end
