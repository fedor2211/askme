module QuestionsHelper
  def hashtag_link(hashtag)
    link_to "##{hashtag.name}", hashtag_questions_path(hashtag.name)
  end

  def question_link(question)
    link_to "Вопрос #{question.id}", question_path(question)
  end
end
