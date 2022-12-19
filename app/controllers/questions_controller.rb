class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[edit update destroy]
  before_action :set_question, only: %i[update show destroy edit hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    question = Question.create(question_params)

    redirect_to user_path(question.user), notice: "Новый вопрос создан!"
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)
    @question.update(question_params)

    redirect_to question_path(@question), notice: "Вопрос обновлён!"
  end

  def destroy
    user = @question.user
    @question.destroy

    redirect_to user_path(user), notice: "Вопрос удалён!"
  end

  def index
    @questions = Question.all
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to question_path(@question), notice: "Вопрос скрыт!"
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end
end
