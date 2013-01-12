class UserFoodItemsController < ApplicationController
	before_filter :signed_in_user

	def new
		@userfooditem = UserFoodItem.new
	end

	def create
		globalfooditem = GlobalFoodItem.find(params[:user_food_item][:global_food_item_id])
		datebought = Date.parse(params[:user_food_item][:datebought])
		usebydate = datebought + globalfooditem.avgexpirationdays

		@user = current_user
		@userfooditem = @user.user_food_items.build(global_food_item_id: globalfooditem.id,
									 datebought: datebought, usebydate: usebydate)

		if @userfooditem.save
			flash[:success] = "#{@userfooditem.global_food_item.name} has been added successfully."
			redirect_to user_url(current_user)
		else
			render 'new'
		end
	end

	def destroy
		UserFoodItem.find(params[:id]).destroy
		flash[:success] = "Item deleted!"

		redirect_to user_url(current_user)
	end

	def edit
		@user_food_item = UserFoodItem.find(params[:id])
	end

	# Fix this later
	def update
		@user_food_item = UserFoodItem.find(params[:id])

		if @user_food_item.update_attributes(params[:user_food_item])
			flash[:success] = "Successfully updated Item: #{@user_food_item.global_food_item.name}"
			redirect_to user_url(current_user)
		else
			render 'edit'
		end
	end

	private

	    def signed_in_user
	      redirect_to signin_url, notice: "Please sign in." unless signed_in?
	    end
end
