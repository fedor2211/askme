class Hashtag < ApplicationRecord
  has_many :hashtag_questions
  has_many :questions, through: :hashtag_questions

  before_validation :downcase_name

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }

  private

  def downcase_name
    name.downcase!
  end
end
