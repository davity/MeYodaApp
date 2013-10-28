class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  
  def index
    @users = User.all
  end
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:valid] = "#{@user.username} user signed up successfully"
      redirect_to users_path
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
		@user.destroy

		redirect_to users_path
  end
  
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:encrypted_password, :salt)
  end
end
