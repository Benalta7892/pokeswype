class CardWishesController < ApplicationController
  def create
    user = current_user
    card = Card.find(params[:card_id])

    card_wish = CardWish.create(user: user, card: card)
  end
end
