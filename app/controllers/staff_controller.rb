class StaffController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:login]

  def dashboard
  end

  def login
    if logged_in?
      redirect_to staff_dashboard_url
    end
  end

  def checkin
    @booking = Booking.new()
    @rooms = Room.all
  end

  def checkout
    @rooms = Room.all
  end

  def payment
  end

  def roommodification
    @rooms = Room.all
  end

  def report
  end

  private

  def require_login
    redirect_to staff_login_url if !logged_in?
  end
end
