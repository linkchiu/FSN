class ApplicationController < ActionController::Base
	include SessionsHelper




	private
	def store_location
		session[:forwarding_url] = request.original_url if request.get?
	end

	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Please Log in"
			redirect_to login_url
		end
	end
end
