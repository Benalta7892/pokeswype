class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def last_captured
    @user = current_user
    @cards_collection = @user.cards
    @total_cards = @user.cards.count
    @recent_cards = @user.cards.order(created_at: :desc)
  end

  def collection
    @user = current_user
    @cards_collection = @user.cards
    @total_cards = @user.cards.count
    @card = Card.find_by(params[:id])
  end

  def favorites
    @user = current_user
    @total_cards = @user.cards.count
    @favorite_cards = @user.user_cards.where(favorite: true)
  end

  def wish_list
    @user = current_user
    @total_cards = @user.cards.count
    @cards_wished = current_user.cards_wished
  end

  def exchangeable_cards
    @user = current_user
    @total_cards = @user.cards.count
    @exchangeable_cards = @user.user_cards.where(exchangeable: true)
  end

  def current_exchanges
    @user = current_user
    @total_cards = @user.cards.count
    @user_exchanges_as_dealer = @user.exchanges_as_dealer.where.not(status: "finished")
    @user_exchanges_as_receiver = @user.exchanges_as_receiver.where.not(status: "finished")
  end
end
