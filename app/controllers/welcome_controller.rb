class WelcomeController < ApplicationController
  def index
  end
  
  def buy
    @card_types = CardType.all
    @george = GEORGE_INDEX
  end
end
