class RecipeFood < ApplicationRecord
  validates :quantity, numericality: { only_integer: true }
  belongs_to :recipe
  belongs_to :food
end
