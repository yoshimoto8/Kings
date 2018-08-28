class PostsController < ApplicationController
  def index
    # 今はallなだけ
    @reviews = Review.all.order(created_at: :desc)
    @reviews = Review.page(params[:page]).per(15)
  end
end
