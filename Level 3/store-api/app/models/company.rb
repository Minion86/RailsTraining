class Company < ApplicationRecord
  has_many :book
  has_many :game
  validates :name, presence: true, length: { minimum: 10 }
end
