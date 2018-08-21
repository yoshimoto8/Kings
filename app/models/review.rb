class Review < ApplicationRecord
  include SaveCategory
  belongs_to :user
  belongs_to :cosmetic, optional: true
  has_many :review_categories, dependent: :destroy
  has_many :categories, through: :review_categories
  accepts_nested_attributes_for :categories
  mount_uploader :review_image, ImageUploader

  enum point: { one: 1, two: 2, three: 3, four: 4, five: 5 }

end
