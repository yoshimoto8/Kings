class CosmeticsesController < ApplicationController
  def search
    if params[:keyword].present?
      Amazon::Ecs.debug = true
      items = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'HealthPersonalCare',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp'
      )

      @search_items = []
      items.items.each do |item|
        args = {
          title: item.get('ItemAttributes/Title'),
          image_url: item.get('LargeImage/URL'),
          url: item.get('DetailPageURL')
        }
        @search_items << Cosmetics.new(args)
      end
    end
  end
end
