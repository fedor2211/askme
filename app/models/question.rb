require "hashtag_parser"

class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true
  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions
  after_save_commit :update_hashtags

  def hidden?
    hidden == true
  end

  private

  def update_hashtags
    hashtags.clear
    new_hashtags = HashtagParser.parse(body)
    new_hashtags += HashtagParser.parse(answer) if answer.present?
    new_hashtags.uniq!
    new_hashtags.each do |hashtag_name|
      hashtag = Hashtag.find_or_create_by(name: hashtag_name.downcase)
      hashtags << hashtag
    end
  end
end
