class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to staff_dashboard_url
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to staff_login_url
    end
  end

  def destroy
    log_out
    redirect_to staff_login_url
  end
end
