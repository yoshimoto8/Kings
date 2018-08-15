class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create_page
    if user_signed_in?
      #この変もしたし
      @item_title = params[:item_title]
      @item_image_url = params[:item_image]
      @cosmetics_url = params[:cosmetics_url]
      @review = Review.new
    else
      redirect_to "/users/sign_in"
    end
  end

  def create
    review = get_review_params
    Cosmetic.new.insert_item(cosmetics_hash(review))
    @review = current_user.reviews.build(review_parameter(review).hash)
    if @review.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private

  def get_review_params
    params.require(:review).permit(:title, :reviews_valuation, :item_comment, :item_image_url, :item_title, :review_image, :cosmetics_url)
  end

  def cosmetics_hash(review)
    {title: review[:item_title], image_url: review[:item_image_url], url: review[:cosmetics_url]}
  end

  def review_parameter(review)
    Review_parameter.new(review)
  end
end
