class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create_page
    if user_signed_in?
      #この変もしたし
      @item_title = params[:item_title]
      @item_image_url = params[:item_image]
      @review = Review.new
    else
      redirect_to "/users/sign_in"
    end
  end

  def create
    @review = current_user.reviews.build(get_review_params.hash)
    if @review.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private

  def get_review_params
    return Review_parameter.new(params.require(:review).permit(:title, :reviews_valuation, :item_comment, :item_image_url, :item_title, :review_image))
  end

  def point(point)
    Review.points[point]
  end
end
