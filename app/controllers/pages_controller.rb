class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cards = Card.all
    @user = current_user
    @favorite_cards = @user.user_cards.where(favorite: true) if user_signed_in?

    @user_exchanges_as_dealer = @user.exchanges_as_dealer.where.not(status: "finished").count if user_signed_in?
    @user_exchanges_as_receiver = @user.exchanges_as_receiver.where.not(status: "finished").count if user_signed_in?
  end

  def dashboard
    @user = current_user
    @cards_collection = @user.cards
    @total_cards = @user.cards.count
    @recent_cards = @user.cards.order(created_at: :desc).limit(3)
  end
end
