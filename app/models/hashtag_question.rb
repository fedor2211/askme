class HashtagQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :hashtag

  validates :question, uniqueness: { scope: :hashtag_id }
end
