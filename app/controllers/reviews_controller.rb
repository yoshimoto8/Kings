class ReviewsController < ApplicationController
  def create_page
    @item_title = params[:item_title]
    @item_image_url = params[:item_image]
    @review = Review.new
  end

  def create
    #リファクタリングしたし 
    review_params = get_review_params
    point = point(review_params[:reviews_valuation])
    Review.create(reviews_valuation: point, title: review_params[:title], item_comment: review_params[:item_comment],
                  item_image: review_params[:item_image_url], item_name: review_params[:item_title])
  end

  private

  def get_review_params
    params.require(:review).permit(:title, :reviews_valuation, :item_comment, :item_image_url, :item_title)
  end

  def point(point)
    Review.points[point]
  end
end
