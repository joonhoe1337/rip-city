class StaffController < ApplicationController
  def dashboard
  end

  def login
    if logged_in?
      redirect_to staff_dashboard_url
    end
  end

  def checkin
  end

  def checkout
  end

  def payment
  end

  def roommodification
  end

  def report
  end
end
