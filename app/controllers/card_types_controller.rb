class CardTypesController < ApplicationController
	def index
		@card_types = CardType.all
	end

	def new
		@card_type = CardType.new
	end

	def create
		@card_type = CardType.new(card_type_params)

		if @card_type.save
			redirect_to @card_type
		else
			render 'edit'
		end
	end

	def show
		@card_type = CardType.find(params[:id])
	end

	# def edit
	# 	@card_type = CardType.find(params[:id])
	# end

	# def update
	# 	@card_type = CardType.find(params[:id])
	# 	if @card_type.update(params[:card_type].permit(:name, :edition))
	# 		redirect_to @card_type
	# 	else
	# 		render 'edit'
	# 	end
	# end

	def destroy
		@card_type = CardType.find(params[:id])
		@card_type.destroy

		redirect_to card_types_path
	end

	private
		def card_type_params
			params.require(:card_type).permit(:name, :edition, :photo_dir)
		end
end
