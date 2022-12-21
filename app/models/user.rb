class User < ApplicationRecord
  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  validates :email, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+@\w+\.[A-Za-z]+\z/ }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/ }
  has_secure_password
  before_validation :downcase_nickname, :downcase_email
  has_many :questions, dependent: :destroy
  has_many :asked_questions, dependent: :nullify, class_name: "Question"

  before_validation :downcase_nickname, :downcase_email

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
