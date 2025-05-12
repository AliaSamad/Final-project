class UsersController < ApplicationController
  before_action :require_login, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to todos_path, notice: "Welcome, #{@user.first_name}!"
    else
      render :new
    end
  end

  def destroy
    current_user.destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Your account and all data have been deleted."
  end

  private

  def user_params
    params.require(:user)
          .permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
