class CardInterestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @card_interest = CardInterest.new
    @card = Card.find(params[:card_id])
  end

  def create
    @card_interest = CardInterest.new(card_interest_params)
    @card_interest.user = current_user
    @card_interest.card = Card.find(params[:card_id])
    if @card_interest.save
      redirect_to card_path(@card_interest.card), alert: "Card added to your collection!"
    else
      render :new, alert: "Something went wrong!"
    end
  end

  private

  def card_interest_params
    params.require(:card_interest).permit(:user_id, :card_id, :exchangeable)
  end
end
