class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :search

  def search
    @cards = Card.all
    if params[:query].present?
      @cards = @cards.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end
    
  def index
    @cards = Card.all
  end
end
