class FridgesController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: [:show]

	def show
	  	@fridges = User.find(params[:id]).fridges	    
  	end

	def new
		@fridge = Fridge.new
	end

	def create				
		@fridge = Fridge.new(:name => params[:fridge][:name])

		if @fridge.save
			flash[:success] = "Successfully saved Fridge"
			@current_user.fridges << @fridge
		
			redirect_to fridge_url(@current_user.id)
		else
			render 'new'
		end		
	end

	def destroy
		@current_user.fridges.find(params[:id]).destroy
		flash[:success] = "Fridge removed!"

		redirect_to fridge_url(@current_user.id)
	end

	private
	    def signed_in_user
	      redirect_to signin_url, notice: "Please sign in." unless signed_in?
	    end

	    def correct_user
	      @user = User.find(params[:id])
	      redirect_to root_url unless current_user?(@user)
	    end
end
