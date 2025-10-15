class User < ApplicationRecord
  has_secure_password

  attribute :introduction, :text, default: '初期プロフィールです。編集してみましょう！'

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :password, length: { minimum: 8 }, allow_blank: true
end
