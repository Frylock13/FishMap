class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    service = Reviews::CreateService.new(review, params[:rating])
    service.call
    flash[:success] = 'Отзыв успешно оставлен'
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:name, :review, :place_id)
  end
end
