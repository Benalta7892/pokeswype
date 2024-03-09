class UsersController < ApplicationController

  def collection
    @user = User.find(params[:id])
    @exchangeable_cards = @user.user_cards.where(exchangeable: true)
  end
end
