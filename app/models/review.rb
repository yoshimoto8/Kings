class Review < ApplicationRecord
  validates :title, presence: true
  validates :review_image, presence: true
  validates :item_comment, presence: true
  validates :reviews_valuation, presence: true
  belongs_to :user
  belongs_to :cosmetic, optional: true

  mount_uploader :review_image, ImageUploader

  enum point: { one: 1, two: 2, three: 3, four: 4, five: 5 }
end
