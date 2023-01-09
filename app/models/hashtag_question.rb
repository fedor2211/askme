class HashtagQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :hashtag

  validates :question, presence: true, uniqueness: { scope: :hashtag_id }
  validates :hashtag, presence: true
  after_destroy :destroy_empty_hashtag

  private

  def destroy_empty_hashtag
    hashtag.destroy if hashtag.questions.empty?
  end
end
