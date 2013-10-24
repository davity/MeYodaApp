class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to @card
    else
      render action: 'new'
    end
  end

  def update
    if @card.update(card_params)
      redirect_to @card
    else
      render action: 'edit'
    end
  end

  def destroy
    @card.destroy
    
    redirect_to cards_url }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:code, :CardType_id)
    end
end
