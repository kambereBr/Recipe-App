class Recipe < ApplicationRecord
  validates :cooking_time, numericality: { only_integer: true }
  validates :preparation_time, numericality: { only_integer: true }
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy
end
