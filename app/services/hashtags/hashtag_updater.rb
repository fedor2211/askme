module Hashtags
  class HashtagUpdater < ApplicationService
    def initialize(question)
      @question = question
    end

    def call
      @question.hashtags.clear
      new_hashtags = @question.body.scan(Hashtag::PATTERN)
      new_hashtags += @question.answer.scan(Hashtag::PATTERN) if @question.answer.present?
      new_hashtags.uniq!
      new_hashtags.each do |hashtag_name|
        hashtag = Hashtag.find_or_create_by(name: hashtag_name.downcase.slice(1..))
        @question.hashtags << hashtag
      end
    end
  end
end
