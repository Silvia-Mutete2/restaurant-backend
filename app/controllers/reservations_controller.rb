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

      post "/reservations" do
        reservation = Reservation.new(params[:reservation])
        if reservation.save
          reservation.to_json
        else
          { errors: reservation.errors.full_messages }.to_json
        end
      end

      

end