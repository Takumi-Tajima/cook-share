class User < ApplicationRecord
  PROFILE_IMAGE_INFORMATION = {
    ICON_SIZE: [100, 100],
  }.freeze

  has_secure_password

  has_one_attached :profile_image do |attachable|
    attachable.variant :icon, resize_to_fit: PROFILE_IMAGE_INFORMATION[:ICON_SIZE]
  end

  attribute :introduction, :text, default: '初期プロフィールです。編集してみましょう！'

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :password, length: { minimum: 8 }, allow_blank: true
end
