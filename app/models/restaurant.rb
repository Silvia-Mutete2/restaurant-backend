class Restaurant < ActiveRecord::Base 
    has_many :reservations 
    has_many :guests, through: :reservations

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true 
    validates :restaurant_name, presence: true, uniqueness: true
    validates :cuisine_type, presence: true
   
end 