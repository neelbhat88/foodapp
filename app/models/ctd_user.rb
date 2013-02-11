class CTDUser
	attr_reader :name, :fridges

	def initialize(userId)
		user = User.find(userId)
		@name = user.name

		# Initialize fridge objects here		
		@fridges = user.fridges if user.fridges.any?		
	end
end