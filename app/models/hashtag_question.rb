class HashtagQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :hashtag

  validates :question, uniqueness: { scope: :hashtag_id }
  after_destroy :destroy_empty_hashtag

  private

  def destroy_empty_hashtag
    hashtag.destroy if hashtag.questions.empty?
  end
end
