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

    patch "/reservations/:id" do
        find_reservation
        if @reservation && @reservation.update(params[:reservation])
          reservation_to_json
        elsif !@reservation
          { errors: "Record not found with id #{params[:id]}" }.to_json
        else
          { errors: @reservation.errors.full_messages }.to_json
        end
      end

    delete "/reservations/:id" do
        find_reservation
        if @reservation&.destroy
          { messages: "Record successfully destroyed" }.to_json
        else
          { errors: "Record not found with id #{params[:id]}" }
        end
      end

    private
  
    def find_reservation
      @reservation = Reservation.find_by_id(params[:id])
    end
  
    def reservation_to_json
      @reservation.to_json
    end



end