class CosmeticsesController < ApplicationController
  def search
    if params[:keyword].present?
      amazon_search= Amazon_item.new(params[:keyword])
      @search_items = amazon_search.search_item()
    end
    # キーワードがない場合バリデーションを組む
  end
end
