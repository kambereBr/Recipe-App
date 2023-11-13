class Food < ApplicationRecord
  validates :price, numericality: { only_integer: true }
  has_many :recipe_foods
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy
end
