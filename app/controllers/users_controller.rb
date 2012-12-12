class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])

    if User.all.count >= 3
      flash[:error] = "We have reached the maximum users allowed in beta mode. Please try
                      back later"
    else
      if @user.save
        flash[:success] = "#{@user.name}, welcome to Neel's Food App!"
        redirect_to user_url(@user) 
        return
      end
    end
  
  	render 'new'  		
  end

end
