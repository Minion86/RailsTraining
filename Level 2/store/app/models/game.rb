class Game < ApplicationRecord
  belongs_to :company
  validates :description, presence: true, length: {maximum:250 }
  validates :name, presence: true
  validates :price, presence: true, numericality: true
end
