class Cosmetic < ApplicationRecord
  def insert_item(search_items)
    search_items.each do |item|
      if already_inserted_db?(item[:url])
        Cosmetic.create(title: item[:title], image_url: item[:image_url], cosmetics_url: item[:url])
        logger.debug("#{item[:url]}を保存しました。")
      end
    end
  end

  private

  def already_inserted_db?(url)
    !Cosmetic.exists?(cosmetics_url: url)
  end
end
