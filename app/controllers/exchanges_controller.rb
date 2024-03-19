class ExchangesController < ApplicationController
  before_action :authenticate_user!

  def show
    @exchange = Exchange.find(params[:id])
    @exchange_cards = @exchange.card_interests
  end

  def create
    @cards = Card.where(id: params[:card_interest_ids])

    @exchange = Exchange.create(dealer: current_user, receiver_id: params[:user_id].to_i)
    @cards.each do |card|
      CardInterest.create(user: current_user, card: card, exchange: @exchange)
    end
    redirect_to exchange_path(@exchange)
  end

  def update
    @cards = Card.where(id: params[:card_interest_ids])

    @exchange = Exchange.find(params[:id])
    @cards.each do |card|
      CardInterest.create(user: current_user, card: card, exchange: @exchange)
    end
    redirect_to exchange_path(@exchange)
  end

  private

  def exchange_params
    params.require(:exchange).permit(:dealer_id, :receiver_id, :meeting_date, :address, :latitude, :longitude, :status)
  end
end
