require "hashtag_parser"

class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true
  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions
  after_save :update_hashtags

  def hidden?
    hidden == true
  end

  private

  def update_hashtags
    old_hashtags = hashtags.map(&:name)
    new_hashtags = HashtagParser.parse(body)
    new_hashtags += HashtagParser.parse(answer) if answer.present?
    new_hashtags.uniq!
    new_hashtags.each do |hashtag_name|
      hashtag = Hashtag.find_or_create_by(name: hashtag_name.downcase)
      HashtagQuestion.create(question: self, hashtag: hashtag)
    end
    remove_unpresented_hashtags(old_hashtags - new_hashtags)
  end

  def remove_unpresented_hashtags(hashtags_to_remove)
    hashtags_to_remove.each do |hashtag_name|
      hashtag = Hashtag.find_by(name: hashtag_name)
      HashtagQuestion.destroy_by(question: self, hashtag: hashtag)
    end
  end
end
