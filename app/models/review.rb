class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cosmetic, optional: true
  has_many :review_categories, dependent: :destroy
  has_many :categories, through: :review_categories
  accepts_nested_attributes_for :categories

  mount_uploader :review_image, ImageUploader

  enum point: { one: 1, two: 2, three: 3, four: 4, five: 5 }

  def save_categories(tags)
    current_tags = self.categories.pluck(:name) unless self.categories.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.categories.delete Category.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      article_category = Category.find_or_create_by(name:new_name)
      self.categories << article_category
    end
  end
end
