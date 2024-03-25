class ReviewsController < ApplicationController
  def create
    @exchange = Exchange.find(params[:exchange_id])
    @review = Review.new(review_params)
    @review.exchange = @exchange
    @review.user = @exchange.receiver
    @review.save
end

private

  def review_params
    params.require(:review).permit(:rating)
  end
end
