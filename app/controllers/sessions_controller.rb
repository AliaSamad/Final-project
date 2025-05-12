class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to todos_path, notice: "Welcome back, #{user.first_name}!"
    else
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to logout_success_path, notice: "You’ve been logged out."
  end

  # Renders app/views/sessions/logged_out.html.erb
  def logged_out
  end
end

