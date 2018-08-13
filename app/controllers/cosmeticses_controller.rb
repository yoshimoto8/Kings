class CosmeticsesController < ApplicationController
  def search
    if params[:keyword].present?
      amazon_search= Amazon_item.new(params[:keyword])
      @search_items = amazon_search.search_item()
      Cosmetic.new().insert_item(@search_items)
    end
  end
end
