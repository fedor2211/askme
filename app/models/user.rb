class User < ApplicationRecord
  validates :navbar_color, format: { with: /\A#\h{6}\z/ }
  has_secure_password

  before_save :downcase_nickname

  def downcase_nickname
    nickname.downcase!
  end
end
