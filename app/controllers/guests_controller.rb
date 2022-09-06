class GuestsController < ApplicationController
    get "/guests" do
        Guest.all.to_json(include: [reservations: { include: { restaurant: { only: [:id, :restaurant_name, :cuisine_type, :image_url] } } }])
      end
    
      get "/guests/:id" do
        find_guest
    
        if @guest
          guest_to_json
        else
          { errors: "Record not found with id #{params[:id]}" }.to_json
        end
      end

      post "/guests" do
        guest = Guest.new(params[:guest])
        if guest.save
          guest.to_json(include: [reservations: { include: { restaurant: { only: [:id, :restaurant_name, :cuisine_type, :image_url] } } }])
        else
          { errors: guest.errors.full_messages }.to_json
        end
      end

      patch "/guests/:id" do
        find_guest
        if @guest && @guest.update(params[:guest])
          guest_to_json
        elsif !@guest
          { errors: "Record not found with id #{params[:id]}" }.to_json
        else
          { errors: @restaurant.errors.full_messages }.to_json
        end
      end

      delete "/guests/:id" do
        find_guest
    
        if @guest&.destroy
          { messages: "Record successfully destroyed" }.to_json
        else
          { errors: "Record not found with id #{params[:id]}" }
        end
      end

end