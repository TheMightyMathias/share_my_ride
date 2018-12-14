class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.reviewer_id = current_user.id
    @review.rating = params[:rating]
    @review.save

  end

  private

  def review_params
    params.require(:review).permit(:rating, :reviewed_id, :trip_id)
  end

end
