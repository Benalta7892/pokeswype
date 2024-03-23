class ReviewsController < ApplicationController
  def create
    @exchange = Exchange.find(params[:exchange_id])
    @review = Review.new(review_params)
    @review.exchange = @exchange
    @review.user = @exchange.receiver
    if @review.save
      redirect_to user_user_cards_path(current_user)
    else
      render "exchanges/show"
  end

end

private

  def review_params
    params.require(:review).permit(:rating)
  end
end
