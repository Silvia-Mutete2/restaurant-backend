class Guest < ActiveRecord::Base 
    has_many :reservations 
    has_many :restaurants, through: :reservations

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
end