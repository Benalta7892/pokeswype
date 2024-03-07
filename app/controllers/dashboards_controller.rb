class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def last_captured
    @user = current_user
    @recent_cards = @user.cards.order(created_at: :desc)
  end

  # def collection
  #   @user = current_user
  #   @cards_collection = @user.cards
  #   @total_cards = @user.cards.count
  # end

  def favorites
    @user = current_user
  end

  def wish_list
    @user = current_user
  end

  def exchangeable_cards
    @user = current_user
  end

  def current_exchanges
    @user = current_user
  end
end
