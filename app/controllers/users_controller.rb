class UsersController < ApplicationController

  def collection
    @user = current_user
    @exchangeable_cards = @user.user_cards.where(exchangeable: true)
  end
end
