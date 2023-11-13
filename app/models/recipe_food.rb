class RecipeFood < ApplicationRecord
  validates :quantity, numericality: { only_integer: true }
  belongs_to :food
  belongs_to :recipe
  has_many :inventories
end
