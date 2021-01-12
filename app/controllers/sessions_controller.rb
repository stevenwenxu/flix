class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by(email: params[:email_or_username]) ||
          User.find_by(username: params[:email_or_username])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to session[:intended_url] || user, notice: "Welcome, #{user.name}!"
      session[:intended_url] = nil
  	else
  		flash.now[:alert] = "Incorrect email/password"
  		render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: "Successfully signed out!"
  end
end
