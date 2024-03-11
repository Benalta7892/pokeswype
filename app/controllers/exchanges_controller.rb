class ExchangesController < ApplicationController
  before_action :authenticate_user!

  def show
    @exchange = Exchange.find(params[:id])
  end

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.dealer = current_user
    raise
    if @exchange.save
      CardInterest.create(user: @exchange.receiver, card: @exchange.dealer_card, exchange: @exchange)
      redirect_to exchange_path(@exchange)
    else
      render :new
    end
  end

  private

  def exchange_params
    params.require(:exchange).permit(:dealer_id, :receiver_id, :meeting_date, :address, :latitude, :longitude, :status)
  end
end
