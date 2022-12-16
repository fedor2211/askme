class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  def downcase_nickname
    nickname.downcase!
  end
end
