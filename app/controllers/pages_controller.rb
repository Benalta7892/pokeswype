class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cards = Card.all
  end

  def dashboard
    @user = current_user
    @cards_collection = @user.cards
    @total_cards = @user.cards.count
    @recent_cards = @user.cards.order(created_at: :desc).limit(3)
  end
end
