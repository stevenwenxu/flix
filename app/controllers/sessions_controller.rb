class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by(email: params[:email_or_username]) ||
          User.find_by(username: params[:email_or_username])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to user, notice: "Welcome, #{user.name}!"
  	else
  		flash.now[:alert] = "Incorrect email/password"
  		render :new
  	end
  end

  def destroy
  end
end