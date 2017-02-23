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
    
    reservation_id = gen_reservation_id(booking)
    while Booking.find_by(reservation_id: reservation_id)
      reservation_id = gen_reservation_id(booking)
    end
    booking.update_attribute(:reservation_id, reservation_id)
   
    booking.update_attribute(:status, 0)

    if booking.save
    else
    end
    redirect_to root_url
  end

  def gen_reservation_id(booking)
    booking.room_type.upcase[0,3] + "-" + rand(10 ** 7).to_s
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
end
