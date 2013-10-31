class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  GEORGE_INDEX = 1.10
  
  protected
  def authenticate_user
    # if there is a session key and the users id exists in the database we are autenticated
    if (session[:user_id] && not(User.where(id: session[:user_id]).blank?))
      @current_user = User.find session[:user_id]
      return true
    else
    # if not, we are redirected to login
      redirect_to(:controller => 'sessions', :action => 'login')	
      return false
    end
  end
  
  def save_login_state
    # if we are autenticated we are redirected to our home
    if session[:user_id] && not(User.where(id: session[:user_id]).blank?)
      redirect_to(:controller => 'sessions', :action => 'home')
      return false
    else
      return true
    end
  end
  
end
