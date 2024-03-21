class ReviewsController < ApplicationController
  def create
    @exchange = Exchange.find(params[:exchange_id])
    @review = Review.new(review_params)
    @review.exchange = @exchange
    @review.user = current_user
    if @review.save
      redirect_to exchange_path(@exchange)
    else
      render "exchanges/show"
  end

end

private

  def review_params
    params.require(:review).permit(:rating)
  end
end
