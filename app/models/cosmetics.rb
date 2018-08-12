class Cosmeticses
  attr_accessor :title, :image_url, :url
  def initialize(args)
    @title = args[:title]
    @image_url = args[:image_url]
    @url = args[:url]
  end
end