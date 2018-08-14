class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cosmetic, optional: true

  mount_uploader :review_image, ImageUploader

  enum point: { one: 1, two: 2, three: 3, four: 4, five: 5 }
end
