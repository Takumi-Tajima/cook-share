class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :cooking_time, numericality: { only_integer: true, greater_than: 0 }
  validates :published, presence: true
end
