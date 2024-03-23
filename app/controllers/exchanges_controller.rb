class ExchangesController < ApplicationController
  before_action :authenticate_user!

  def show
    @exchange = Exchange.find(params[:id])
    @exchange_cards = @exchange.card_interests
    @review = Review.new
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

  def update_status
    @exchange = Exchange.find(params[:id])
    if @exchange.update(status: "finished") && add_cards_to_collection
      flash[:notice] = "Exchange finished"
    end
    redirect_to qrcode_exchange_path(@exchange)
  end

  def qrcode
    @exchange = Exchange.find(params[:id])
    @user_cards = @exchange.card_interests.where(user: current_user)
    @review = Review.new
  end

  private

  def add_cards_to_collection
    @exchange.cards.each do |card|
      add_card_to_user_collection(@exchange.receiver, card)
      add_card_to_user_collection(@exchange.dealer, card)
    end
  end

  def add_card_to_user_collection(user, card)
    if UserCard.exists?(user: user, card: card)
      UserCard.find_by(user: user, card: card).destroy
    else
      UserCard.create(user: user, card: card, exchangeable: false)
    end
  end

  def exchange_params
    params.require(:exchange).permit(:dealer_id, :receiver_id, :meeting_date, :address, :latitude, :longitude, :status, :qrcode)
  end
end
