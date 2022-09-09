class Reservation < ActiveRecord::Base 
    belongs_to :restaurant 
    belongs_to :guest

    validates :date, presence: true 
    validates :time, presence: true
    validates :number_of_guests, presence: true 
    validates :restaurant_id, presence: true 
    validates :guest_id, presence: true  
end 