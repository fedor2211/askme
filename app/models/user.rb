class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+@\w+\.[A-Za-z]+\z/ }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/ }
  has_secure_password

  before_save :downcase_nickname

  def downcase_nickname
    nickname.downcase!
  end
end
