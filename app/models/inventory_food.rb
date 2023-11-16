class InventoryFood < ApplicationRecord
  validates :quantity, numericality: { only_integer: true }
  belongs_to :inventory
  belongs_to :food
end
