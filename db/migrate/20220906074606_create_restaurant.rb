class CreateRestaurant < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :username 
      t.string :password
      t.string :restaurant_name 
      t.string :cuisine_type 
    
      t.integer :capacity 
      t.timestamps 
    end 
  end
end
