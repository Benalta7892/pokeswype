class UsersController < ApplicationController

  def collection
    @user = User.find(params[:id])
    @exchangeable_cards = @user.user_cards.where(exchangeable: true)
    @exchange = Exchange.find(params[:exchange_id]) if params[:exchange_id]
  end
end
