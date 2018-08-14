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
    #リファクタリングしたし 
    review_params = get_review_params
    point = point(review_params[:reviews_valuation])
    cosmetic = Cosmetic.find_by(title: get_review_params[:item_title]).id
    @review = current_user.reviews.build(cosmetics_id: cosmetic, reviews_valuation: point, title: review_params[:title], item_comment: review_params[:item_comment],
                               item_image: review_params[:item_image_url], item_name: review_params[:item_title])
    if @review.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private

  def get_review_params
    params.require(:review).permit(:title, :reviews_valuation, :item_comment, :item_image_url, :item_title)
  end

  def point(point)
    Review.points[point]
  end
end
