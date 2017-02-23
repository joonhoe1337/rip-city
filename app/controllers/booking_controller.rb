class BookingController < ApplicationController
  def new
    if params.has_key?(:booking)
      @booking = Booking.new(booking_params)
      session[:booking] = booking_params
    else
      redirect_to root_url
    end
  end

  def create
    session[:booking].deep_merge!(params[:booking])
    booking = Booking.new(session[:booking])
    
    booking.update_attribute(:reservation_id, gen_reservation_id(booking))
   
    booking.update_attribute(:status, 0)

    if booking.save
    else
    end
    @reservation_id = booking.reservation_id
    render 'shared/reservation_id'
  end

  def update
    if params.has_key?(:button)
      @rooms = Room.all
      @booking = Booking.find_by(reservation_id: params[:checkin][:reservation_id])
      if @booking
        flash.now[:success] = "Found reservation."
      else
        @booking = Booking.new
        flash.now[:danger] = "Reservation ID is invalid."
      end
      render 'staff/checkin'
    elsif params.has_key?(:commit)
      booking = nil
      if params[:checkin][:reservation_id].empty?
        booking = Booking.new(checkin_params)
        booking.update_attribute(:reservation_id, gen_reservation_id(booking))
        booking.update_attribute(:status, 1)
        booking.update_attribute(:checkin_date, DateTime.now)

        booking.save
      end

      room = Room.find_by(room_id: params[:checkin][:room_id])
      if room && room.available?
        room.update_attribute(:status, 1)
        flash[:success] = "Check in successfully."
      else
        booking.destroy if booking
        flash[:danger] = "Failed to check in: Room ID is invalid/not available."
      end
      
      redirect_to staff_checkin_url
    else
      redirect_to staff_checkin_url
    end
  end

  def gen_reservation_id(booking)
    id = booking.room_type.upcase[0,3] + "-" + rand(10 ** 7).to_s
    while Booking.find_by(reservation_id: id)
      id = booking.room_type.upcase[0,3] + "-" + rand(10 ** 7).to_s
    end
    return id
  end

  def booking_params
    params.require(:booking).permit(:checkin_date,
                                    :checkout_date,
                                    :room_type,
                                    :room_no,
                                    :adult_no,
                                    :child_no
    )
  end

  def checkin_params
    params.require(:checkin).permit(:name,
                                    :email,
                                    :address,
                                    :room_type,
                                   )
  end
end
