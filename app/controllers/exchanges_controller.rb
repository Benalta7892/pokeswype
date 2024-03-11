class ExchangesController < ApplicationController
  before_action :authenticate_user!

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.dealer = current_user

    if @exchange.save
      redirect_to exchange_path(@exchange), alert: "Exchange created!"
    else
      render :new, alert: "Something went wrong!"
    end
  end

  private

  def exchange_params
    params.require(:exchange).permit(:dealer_id, :receiver_id, :meeting_date, :address, :latitude, :longitude, :status)
  end
end
