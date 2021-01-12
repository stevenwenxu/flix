class ApplicationController < ActionController::Base
	private

	# this is equivalent to putting it as a view helper. This method is now accessible from both controllers and views.
	helper_method :current_user

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def require_signin
		unless @current_user
			redirect_to signin_path, alert: "Please sign in first!"
		end
	end
end
