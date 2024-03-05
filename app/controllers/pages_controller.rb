class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cards = Card.all
  end

  def dashboard
    @user = current_user
    @total_cards = @user.cards.count
  end
end
