class SessionsController < ApplicationController
	def new
	end

	def create
		# Here we dont' use @user because @ variables are instance variables which means they
		# are visible to the view. We don't care about user being visible to the view.
		user = User.find_by_email(params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user_url(user)
		else
			# flash.now shows the message on the rendered page and doesnt show it on the next page
			# that is clicked on since using flash will remove the message on the next request.
			# Clicking to a new page is the next request but a render is not
			flash.now[:error] = "Invalid email and password combination"
			render 'new'
		end
	end	

	def destroy
		sign_out

		redirect_to root_url
	end
end
