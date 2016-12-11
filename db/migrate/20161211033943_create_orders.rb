class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.integer :user_id , :index => true
    	t.string :email
    	t.string :receiver_name
    	t.string :cellphone
    	t.string :address

    	t.integer :amout
    	
      t.timestamps
    end
  end
end
