class User < ApplicationRecord
  before_save { self.email.downcase! }
  
  # バリデーションチェック
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  #　パスワード付モデルのための有効化
  has_secure_password
end
