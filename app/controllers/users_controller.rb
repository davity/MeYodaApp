class UsersController < ApplicationController
  #include AccountsController
      
  before_filter :save_login_state, :only => [:new, :create]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    @account = Account.new
  end
  
  def create
    @user = User.new(user_params)
    @account = Account.new(params[:account].permit(:number))
    if @user.save
    # once we have a user we try to create its account
      params[:account][:balance] = 0.0
      @account = @user.accounts.new(params[:account].permit(:number, :balance))
      if @account.save
        flash[:valid] = "#{@user.username} user signed up successfully"
        redirect_to users_path and return
      else
      # if we cant create the account we have to delete the user created before
        @user.destroy
      end
    end
    render new_user_path
  end

  def destroy
    @user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
  end
  
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end
end
