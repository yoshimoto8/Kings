class Category < ApplicationRecord
  validates :name,presence:true,length:{maximum:50}
  has_many :cosmetics, through: :cosmetics_categories
  has_many :cosmetics_categories, dependent: :destroy
  has_many :review, through: :reviews_categories
  has_many :reviews_categories, dependent: :destroy
end
