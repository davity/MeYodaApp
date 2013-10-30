class BidsController < ApplicationController
	def new
		@card_type = CardType.find(params[:card_type_id])
    @george = GEORGE_INDEX
  end
end
