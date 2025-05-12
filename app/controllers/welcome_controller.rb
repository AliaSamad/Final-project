class WelcomeController < ApplicationController
  def index
    # if the user is already logged in, send them to their ToDos
    redirect_to todos_path and return if logged_in?
    # otherwise, fall through and render the welcome page
  end
end

