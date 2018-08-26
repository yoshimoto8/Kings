class NewReviewModel
  attr_reader :item_title, :item_image_url, :cosmetics_url
  def initialize(args)
    @item_title = args[:item_title]
    @item_image_url = args[:item_image]
    @cosmetics_url = args[:cosmetics_url]
  end

  def review
    @review ||= Review.new
  end

  def category
    @category ||= Category.new
  end
end

