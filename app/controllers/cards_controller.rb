class CardsController < ApplicationController
  before_action :set_card, only: [:show]
  skip_before_action :authenticate_user!, only: [:search, :index, :show]

  def search
    @cards = Card.all
    if params[:query].present?
      @cards = @cards.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def index
    @cards = Card.all
  end

  def show
  end

  def collectors
    # afficher la carte
    # trouver les collectionneurs qui ono la meme carte exangeable true
    # afficher tous les collectionneurs
  end

  private

  def card_params
    params.require(:card).permit(:name, :price, :serie, :image, :release_date, :number, :rarity, :category, :extension)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
