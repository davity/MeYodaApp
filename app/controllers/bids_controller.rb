class BidsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create]
  
	def new
	  @bid = Bid.new
		@card_type = CardType.find(params[:id])
		@low_price = get_lowest_price(@card_type)
    @george = GEORGE_INDEX
    @earn = EARN_INDEX
  end
  
  def create
    @card_type = CardType.find(params[:id])
    @bid = @card_type.bids.build(bid_params)	
    @bid.user_id = session[:user_id]
    if @bid.save
      flash[:valid] = "Your have bid for #{@card_type.name} card"
      redirect_to buy_path
    else
      @low_price = get_lowest_price(@card_type)
      @george = GEORGE_INDEX
      @earn = EARN_INDEX
      render "new"
    end
  end
  
  def destroy
    @user = User.find session[:user_id]
    @bid = @user.bids.find_by(params[:id])
		@bid.destroy
		redirect_to buy_path
  end
  
  def bid_params
    params.require(:bid).permit(:value)
  end
  
  def get_lowest_price(card_type)
    low_price = 0
		if Card.where(card_type_id: card_type.id).joins(:sale).any?
		  low_price = Card.where(card_type_id: card_type.id).joins(:sale).first.sale.starting_price
		end
		card_type.cards.each do |card|
	    if not(card.sale.nil?)
	      if card.sale.starting_price < low_price
	        low_price = card.sale.starting_price
	      end
	    end
	  end
	  return low_price
  end
end
