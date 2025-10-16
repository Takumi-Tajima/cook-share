class User < ApplicationRecord
  PROFILE_IMAGE_INFORMATION = {
    ICON_SIZE: [100, 100],
  }.freeze

  has_one_attached :profile_image do |attachable|
    attachable.variant :icon, resize_to_fit: PROFILE_IMAGE_INFORMATION[:ICON_SIZE]
  end

  has_secure_password

  attr_accessor :current_password

  attribute :introduction, :text, default: '初期プロフィールです。編集してみましょう！'

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :password, length: { minimum: 8 }, allow_blank: true

  validate :verify_current_password_for_email_change, if: :email_changed?

  # パスワード変更時: has_secure_passwordによってバリデーション前にpassword_digestが更新されるため、
  # バリデーションではなくbefore_updateコールバックで現在のパスワードを検証する
  before_update :verify_current_password_for_password_change, if: :password_digest_changed?

  private

  def verify_current_password_for_email_change
    verify_current_password
  end

  def verify_current_password_for_password_change
    verify_current_password
  end

  def verify_current_password
    return if current_password.present? && authenticate(current_password)

    if current_password.blank?
      errors.add(:current_password, '変更には現在のパスワードが必要です')
    else
      errors.add(:current_password, 'が正しくありません')
    end
  end
end
