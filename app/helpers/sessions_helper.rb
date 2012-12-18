module SessionsHelper
	def sign_in(user)
		# Store logged in userId into session
        session[:userId] = user.id

        # Assignment function
        self.current_user = user
	end

	def sign_out()		
		self.current_user = nil

		session[:userId] = nil # or delete cookie here if using cookies
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user? (user)
		user == current_user
	end

	# Almost like a setter?
	def current_user=(user)
		# Create an instance variable so that it can be viewed by the controller and view
		@current_user = user
	end

	# Almost like a getter?
	def current_user
		@current_user ||= User.find_by_id(session[:userId])
	end
end
