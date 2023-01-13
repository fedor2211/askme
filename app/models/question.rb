class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true
  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions
  after_save_commit do
    Hashtags::HashtagUpdater.call(self)
  end

  def hidden?
    hidden == true
  end
end
