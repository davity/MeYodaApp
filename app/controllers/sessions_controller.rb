class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  
  def login
  end
  
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:valid] = "Welcome, you logged in as #{authorized_user.username}"
      redirect_to home_path
    else
      flash[:error] = "Error: Invalid Username or Password"
      render "login"	
    end
  end

  def user_params
    params.require(:session).permit(:username_or_email)
  end
  
  def login_params
    params.require(:user).permit(:login_password)
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
  
  def home
  end

  def profile
  end

  def setting
  end
end
