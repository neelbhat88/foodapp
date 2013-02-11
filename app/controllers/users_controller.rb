class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :update]
  before_filter :correct_user, only: [:show, :edit, :update]

  def new
  	@user = User.new
  end

  def show
    @ctd_user = CTDUserRepository.GetCTDUserById(params[:id])

    # Pass all items in global food db up to view for the typeahead
    @global_food_items = GlobalFoodItem.select("name").all.map{|item| item.name}
  end

  def create
  	@user = User.new(params[:user])

    if User.all.count >= 3
      flash.now[:error] = "We have reached the maximum users allowed in beta mode. Please try
                      back later"
    else
      if @user.save
        flash[:success] = "#{@user.name}, welcome to Neel's Food App!"

        # Store logged in userId into session
        sign_in(@user)

        redirect_to user_url(@user) 
        return
      end
    end
  
  	render 'new'  		
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
