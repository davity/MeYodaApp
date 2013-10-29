class CardsController < ApplicationController
	
	def index
		@cards = Card.all
	end

	def show
		@card = Card.find(params[:id])
	end

	def new
		@card = Card.new
		@card_type = CardType.new
		@card_types = CardType.all
	end

	def create
		@card_type = CardType.find_by(:name => params[:card][:card_types][:name])
		@card = @card_type.cards.create()

		if @card.save
			redirect_to @card
		else
			render action: 'new'
		end
	end

	def edit
		@card = Card.find(params[:id])
		@card_type = @card.card_type
	end

	def update
		@card = Card.find(params[:id])

		if @card.update(card_params)
		  redirect_to @card
		else
	      render action: 'edit'
	  	end
	end

	def destroy
    @card = Card.find(params[:id])
		@card.destroy

	 redirect_to cards_url
	end

	private
		def card_params
		  params.require(:card).permit(:name, :edition)
    	end
end
