module QuestionsHelper
  def question_link(question)
    link_to "Вопрос #{question.id}", question_path(question)
  end
end
