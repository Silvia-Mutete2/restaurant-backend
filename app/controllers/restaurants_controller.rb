class RestaurantsController < ApplicationController
    get "/restaurants" do
        Restaurant.all.to_json(include: [reservations: { include: { guest: { only: [:name] } } }])
      end
    
      get "/restaurants/:id" do
        find_restaurant
    
        if @restaurant
          restaurant_to_json
        else
          { errors: "Record not found with id #{params[:id]}" }.to_json
        end
      end

end