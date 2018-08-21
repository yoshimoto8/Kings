class Amazon_item
  attr_reader :keyword
  
  def initialize(keyword)
    @keyword = keyword
  end

  def search_item
    Amazon::Ecs.debug = false
    items = Amazon::Ecs.item_search(
      keyword,
      search_index:  'HealthPersonalCare',
      dataType: 'script',
      response_group: 'ItemAttributes, Images',
      country:  'jp'
    )

    return filter_item(items)
  end

  private

  def filter_item(items)
    search_items = []
    items.items.each do |item|
      args = {
        title: item.get('ItemAttributes/Title'),
        image_url: item.get('LargeImage/URL'),
        url: item.get('DetailPageURL')
      }
      search_items << args
    end
    return search_items
  end
end
