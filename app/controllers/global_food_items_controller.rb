class GlobalFoodItemsController < ApplicationController
	def index
		@global_food_items = GlobalFoodItem.all
	end

	def new
		@global_food_item = GlobalFoodItem.new
	end

	def create		
		@global_food_item = GlobalFoodItem.new(params[:global_food_item])

		if @global_food_item.save
			flash[:success] = "Successfully saved Food Item: #{@global_food_item.name}"
			if params[:save_add_another]
				redirect_to new_global_food_item_url
			else
				redirect_to global_food_items_url
			end
		else
			render 'new'
		end
	end

	def edit
		@global_food_item = GlobalFoodItem.find(params[:id])
	end

	def update
		@global_food_item = GlobalFoodItem.find(params[:id])

		if @global_food_item.update_attributes(params[:global_food_item])
			flash[:success] = "Successfully updated Food Item: #{@global_food_item.name}"
			redirect_to global_food_items_url
		else
			render 'edit'
		end
	end

	def destroy
		GlobalFoodItem.find(params[:id]).destroy
		UserFoodItem.where("global_food_item_id = ?", params[:id]).destroy_all()
		flash[:success] = "Food Item deleted!"

		redirect_to global_food_items_url
	end
end
