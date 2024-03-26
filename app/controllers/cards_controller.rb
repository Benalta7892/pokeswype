class CardsController < ApplicationController
  before_action :set_card, only: [:show, :collectors]
  skip_before_action :authenticate_user!, only: [:search, :index, :show]

  def search
    @cards = Card.all
    if params[:query].present?
      @cards = @cards.where("name ILIKE ?", "%#{params[:query]}%")
    end
    @cards_wished = current_user.cards_wished
    @cards = @cards - @cards_wished
  end

  def index
    @cards = Card.all
  end

  def show
  end

  def collectors
    @collectors = @card.ready_for_exchange_collectors
    @exchangeable_cards_count = 0

    # Compter les cartes échangeables pour chaque collectionneur
    @collectors.each do |collector|
      # Accéder aux cartes du collectionneur via la table UserCard
      user_cards = collector.user_cards.where(card: @card)
      @exchangeable_cards_count += user_cards.where(exchangeable: true).count
    end
  end

  private

  def card_params
    params.require(:card).permit(:name, :price, :serie, :image, :release_date, :number, :rarity, :category, :extension)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
