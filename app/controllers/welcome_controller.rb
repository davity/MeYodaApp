class WelcomeController < ApplicationController
  def index
  end
  
  def buy
    @card_types = CardType.all
    @sales = Sale.all
    @george = GEORGE_INDEX
    @earn = EARN_INDEX
    if session[:user_id]
      @user = User.find session[:user_id]
    end
  end
end
