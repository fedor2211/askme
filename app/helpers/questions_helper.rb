module QuestionsHelper
  def hashtag_link(hashtag)
    link_to "##{hashtag.name}", root_path(tag: hashtag.name)
  end
end
