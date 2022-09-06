class CreateGuest < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :username
      t.string :password 
      t.string :name
      t.timestamps
    end 
  end
end
