class Cosmetic < ApplicationRecord
  include SaveCategory
  has_many :reviews
  has_many :cosmetic_categories, dependent: :destroy
  has_many :categories, through: :cosmetic_categories

  def insert_item(review)
    if already_inserted_db?(review[:url])
      Cosmetic.create(title: review[:title], image_url: review[:image_url], cosmetics_url: review[:url])
      logger.debug("#{review[:url]}を保存しました。")
    end
  end

  private

  def already_inserted_db?(url)
    !Cosmetic.exists?(cosmetics_url: url)
  end
end
