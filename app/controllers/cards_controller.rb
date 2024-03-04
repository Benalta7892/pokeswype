class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
end
