class CosmeticCategory < ApplicationRecord
  belongs_to :cosmetic
  belongs_to :category
  validates :cosmetic_id, presence:true
  validates :category_id, presence:true
end
