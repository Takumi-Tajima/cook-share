class Category < ApplicationRecord
  has_many :recipes, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true

  scope :default_order, -> { order(name: :asc) }
end
