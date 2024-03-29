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

	def addItem
		globalfooditem = GlobalFoodItem.find_by_name(params[:itemName])
		@fridge = Fridge.find(params[:fridgeId])

		if globalfooditem
			datebought = Date.today
			usebydate = datebought + globalfooditem.avgexpirationdays
			
			lastitem = @fridge.user_food_items.where("global_food_item_id = ? and price > 0", globalfooditem.id).order("updated_at DESC").first
			if lastitem
				lastprice = lastitem.price.to_d
			end

			@user = current_user
			@userfooditem = @fridge.user_food_items.build(global_food_item_id: globalfooditem.id,
									 datebought: datebought, usebydate: usebydate, status: 0,
									 name: globalfooditem.name, price: lastprice)

			#ToDo: Error checking here
			@userfooditem.save
		end
	end

	def addAsLeftovers
		itemname = params[:itemName]
		@fridge = Fridge.find(params[:fridgeId])

		
		datebought = Date.today
		#usebydate = datebought + globalfooditem.avgexpirationdays

		@user = current_user
		@userfooditem = @fridge.user_food_items.build(name: itemname, datebought: datebought, status: 0)

		#ToDo: Error checking here
		@userfooditem.save
	end

	def destroy
		#UserFoodItem.find(params[:id]).destroy
		userfooditem = UserFoodItem.find(params[:id])
		@fridge = Fridge.find(userfooditem.fridge_id)

		if params[:status] == "-1"
			UserFoodItem.find(params[:id]).destroy()
		else
			userfooditem.update_attributes(:status => params[:status].to_i)
			userfooditem.update_attributes(:removedate => Date.today)
			#flash[:success] = "Item deleted!"		
		end	

		@user = current_user

		respond_to do |format|
      		format.html { redirect_to user_url(current_user) }
      		format.js
    	end
	end

	def edit
		@user_food_item = UserFoodItem.find(params[:id])
	end

	# Fix this later
	def update
		@user_food_item = UserFoodItem.find(params[:id])
		
		new_date = Date.strptime(params[:user_food_item][:usebydate], "%m/%d/%y").strftime("%Y-%m-%d")

		if @user_food_item.update_attributes(:fridge_id => params[:user_food_item][:fridge_id],
											 :usebydate => new_date,
											 :price => params[:user_food_item][:price].to_d)
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
