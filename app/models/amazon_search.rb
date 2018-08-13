class Amazon_search
  attr_accessor :title, :image_url, :url
  def initialize(args)
    @title = args[:title]
    @image_url = args[:image_url]
    @url = args[:url]
  end

  def insert_item()
  end

  private

  def already_inserted_db?
  end
end