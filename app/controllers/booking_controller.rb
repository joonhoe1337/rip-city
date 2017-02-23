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
    booking.update_attribute(:status, 0)
    if booking.save
    else
    end
    redirect_to root_url
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
