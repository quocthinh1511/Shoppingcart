class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if true #user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_url
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    # Log the user in and redirect to the user's show page.
    else
    # Create an error message.
    flash[:danger] = 'Invalid email/password combination' # Not quite right!
    render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def confirm
     @user.activated = true
     redirect_to root_url
  end
end

