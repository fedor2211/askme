class Hashtag < ApplicationRecord
  PATTERN = /#[\p{Word}-]+/i
  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  before_validation :downcase_name

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }

  private

  def downcase_name
    name.downcase!
  end
end
