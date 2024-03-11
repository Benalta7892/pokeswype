class CardInterestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cards = Card.where(id: params[:card_interest_ids])


    @exchange = Exchange.create(dealer: current_user, receiver_id: params[:user_id].to_i)
    @cards.each do |card|
      CardInterest.create(user: current_user, card: card, exchange: @exchange)
    end
    redirect_to exchange_path(@exchange)
  end
end
