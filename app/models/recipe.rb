class Recipe < ApplicationRecord
  extend Enumerize

  enumerize :difficulty, in: %i[easy normal hard]

  belongs_to :user
  belongs_to :category
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
  validates :description, presence: true
  validates :cooking_time, numericality: { only_integer: true, greater_than: 0 }
  validates :published, presence: true

  scope :default_order, -> { order(:id) }
  scope :published, -> { where(published: true) }
end
