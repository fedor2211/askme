class HashtagsController < ApplicationController
  before_action :set_hashtag, only: %i[show]

  def show
    @questions = @hashtag.questions.includes(%i[author user hashtags])
  end

  private

  def set_hashtag
    @hashtag = Hashtag.find_by(name: params[:name])
  end
end
