class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true
  validates :amount, presence: true
  validates :recipe_id, uniqueness: { scope: :name }
end
