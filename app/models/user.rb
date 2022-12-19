class User < ApplicationRecord
  validates :navbar_color, format: { with: /\A#\h{6}\z/ }
  has_secure_password
  before_validation :downcase_nickname, :downcase_email
  has_many :questions, dependent: :destroy

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
