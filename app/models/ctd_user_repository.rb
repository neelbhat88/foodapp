class CTDUserRepository
	def self.GetCTDUserById(id)
		return CTDUser.new(id)
	end
end