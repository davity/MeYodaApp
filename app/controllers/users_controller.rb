class UsersController < ApplicationController
  #include AccountsController
  before_filter :save_login_state, :only => [:new, :create,:index]
  before_filter :authenticate_user, :only => [:update]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    @account = @user.build_account()
  end
  
  def create
    @user = User.new(user_params)
    @account = Account.new(params[:account].permit(:number))
    if @user.save
    # once we have a user we try to create its account
      params[:account][:balance] = 0.0
      @account = @user.build_account(params[:account].permit(:number, :balance))
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
  
  def update
    @user = @current_user
    @user.update(user_params)
    @user.account.update(account_params)
    if @user.errors.any?
      redirect_to home_path, :flash =>{:error => @user.errors.full_messages.first}
    elsif @user.account.errors.any?
      redirect_to home_path, :flash =>{:error => @user.account.errors.full_messages.first}
    else
      redirect_to home_path, :flash =>{:valid => @user.username + 'user updated succesfully'}
    end
  end
  
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end
  
  def account_params
    params.require(:account).permit(:number,:balance)
  end
  
end
