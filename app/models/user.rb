class User < ApplicationRecord
  PROFILE_IMAGE_INFORMATION = {
    ICON_SIZE: [100, 100],
  }.freeze

  has_secure_password

  has_one_attached :profile_image do |attachable|
    attachable.variant :icon, resize_to_fit: PROFILE_IMAGE_INFORMATION[:ICON_SIZE]
  end

  attr_accessor :current_password

  attribute :introduction, :text, default: '初期プロフィールです。編集してみましょう！'

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :password, length: { minimum: 8 }, allow_blank: true
  validate :password_required_for_email_change, if: :email_changed?
  validate :password_required_for_password_change, if: :password_digest_changed?

  private

  def password_required_for_email_change
    if current_password.blank?
      errors.add(:current_password, 'メールアドレスを変更する場合は現在のパスワードが必要です')
    elsif authenticate(current_password) == false
      errors.add(:current_password, 'が正しくありません')
    end
  end

  def password_required_for_password_change
    if current_password.blank?
      errors.add(:password, 'を変更する場合は現在のパスワードが必要です')
    elsif authenticate(current_password) == false
      errors.add(:password, 'が正しくありません')
    end
  end
end
