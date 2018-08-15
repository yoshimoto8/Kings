class Review_parameter
  attr_accessor :reviews_valuation, :cosmetics_id, :title, :item_comment, :item_image, :item_name
  def initialize(args)
    @reviews_valuation = point(args[:reviews_valuation])
    @cosmetic_id = search_cosmetic_id(args[:item_title])
    @title = args[:title]
    @item_comment = args[:item_comment]
    @item_image = args[:item_image_url]
    @item_name = args[:item_title]
    @review_image = args[:review_image]
    @cosmetics_url = args[:cosmetics_url]
  end

  def hash
    {reviews_valuation: @reviews_valuation, cosmetic_id: @cosmetic_id,
     title: @title, item_comment: @item_comment, item_image: @item_image,
     item_name: @item_name, review_image: @review_image}
  end

  private

  def search_cosmetic_id(item_title)
    Cosmetic.find_by(title: item_title).id
  end

  def point(point)
    Review.points[point]
  end
end