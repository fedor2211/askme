module QuestionsHelper
  def hashtag_link(hashtag)
    link_to "##{hashtag.name}", root_path(tag: hashtag.name)
  end

  def question_link(question)
    link_to "Вопрос #{question.id}", question_path(question)
  end
end
