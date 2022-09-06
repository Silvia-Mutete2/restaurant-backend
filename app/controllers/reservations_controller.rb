class ReservationsController < ApplicationController
    get "/reservations" do
        Reservation.all.to_json
      end
    
      get "/reservations/:id" do
        find_reservation
    
        if @reservation
          reservation_to_json
        else
            { errors: "Record not found with id #{params[:id]}" }.to_json
        end
      end

end