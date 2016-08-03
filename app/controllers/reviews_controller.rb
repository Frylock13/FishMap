class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: :create

  def create
    if current_user
      review = current_user.reviews.new(review_params)
    else
      review = Review.new(review_params)
    end

    service = Reviews::CreateService.new(review, params[:rating])
    if !session[:reviewed].include?(review.place_id) && service.call
      flash[:success] = 'Отзыв успешно оставлен'
      session[:reviewed] << review.place_id
    else
      flash[:danger] = 'Вы уже оставляли отзыв'
    end
    redirect_to :back
  end

  def like
    if session[:likes].include?(params[:review_id].to_i)
      flash[:danger] = 'Вы уже оценивали этот отзыв'
    else
      review = Review.find(params[:review_id])
      review.increment!(:likes)
      session[:likes] << review.id
      flash[:success] = 'Вы успешно оценили отзыв'
    end

    redirect_to :back
  end

  def dislike
    if session[:dislikes].include?(params[:review_id].to_i)
      flash[:danger] = 'Вы уже оценивали этот отзыв'
    else
      review = Review.find(params[:review_id])
      review.increment!(:dislikes)
      session[:dislikes] << review.id
      flash[:success] = 'Вы успешно оценили отзыв'
    end

    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:name, :review, :place_id)
  end
end
