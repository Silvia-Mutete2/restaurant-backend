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

end