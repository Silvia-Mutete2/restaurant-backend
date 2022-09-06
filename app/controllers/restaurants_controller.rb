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

    post "/restaurants" do
        restaurant = Restaurant.new(params[:restaurant])
        if restaurant.save
          restaurant.to_json
        else
          { errors: restaurant.errors.full_messages }.to_json
        end
      end

    patch "/restaurants/:id" do
        find_restaurant
        if @restaurant && @restaurant.update(params[:restaurant])
          restaurant_to_json
        elsif !@restaurant
          { errors: "Record not found with id #{params[:id]}" }.to_json
        else
          { errors: @restaurant.errors.full_messages }.to_json
        end
      end

    delete "/restaurants/:id" do
        find_restaurant
        if @restaurant&.destroy
          { messages: "Record successfully destroyed" }.to_json
        else
          { errors: "Record not found with id #{params[:id]}" }
        end
      end

    private
  
    def find_restaurant
      @restaurant = Restaurant.find_by_id(params[:id])
    end
  
    def restaurant_to_json
      @restaurant.to_json(include: [reservations: { include: { guest: { only: [:name] } } }])
    end


end