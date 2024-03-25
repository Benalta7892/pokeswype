class UserCardsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = current_user
    @user_cards = @user.user_cards
    @total_cards = @user_cards.count

    if params[:filter] == "exchangeable"
      @user_cards = @user_cards.where(exchangeable: true)
    elsif params[:filter] == "favorite"
      @user_cards = @user_cards.where(favorite: true)
    end
  end

  def create
    @user_card = current_user.user_cards.build(card_id: user_card_params[:card_id])

    if @user_card.save
      redirect_to user_user_cards_path(current_user), notice: 'Card was successfully added to your collection.'
    else
      redirect_to card_path(user_card_params[:card_id]), alert: 'Failed to add the card to your collection.'
    end
  end

  def update
    @user_card = current_user.user_cards.find(params[:id])
    @user_card.update(user_card_params)
  end

  def destroy
    @user_card = current_user.user_cards.find(params[:id])

    if @user_card.destroy
      redirect_to user_user_cards_path(current_user), notice: 'Card was successfully removed from your collection.'
    else
      redirect_to user_user_cards_path(current_user), alert: 'Failed to remove the card from your collection.'
    end
  end

  private

  def user_card_params
    params.require(:user_card).permit(:card_id, :exchangeable, :favorite)
  end
end
