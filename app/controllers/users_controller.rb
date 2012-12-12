class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
      flash[:success] = "#{@user.name}, welcome to Neel's Food App!"
  		redirect_to user_url(@user)
  	else
  		render 'new'
  	end
  		
  end

end
