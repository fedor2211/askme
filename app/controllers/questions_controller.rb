class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[edit update destroy hide]
  before_action :set_question, only: %i[show]

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    question_params[:author] = current_user
    @question = Question.new(question_params)

    if check_captcha(@question) && @question.save
      redirect_to user_path(@question.user.nickname), notice: "Новый вопрос создан!"
    else
      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)
    @question.update(question_params)

    redirect_to question_path(@question), notice: "Вопрос обновлён!"
  end

  def destroy
    user = @question.user
    @question.destroy

    redirect_to user_path(user.nickname), notice: "Вопрос удалён!"
  end

  def index
    @hashtags = Hashtag.joins(:questions).distinct.order(created_at: :desc)
    @questions = Question.includes(%i[user author hashtags]).order(created_at: :desc).first(10)
    @users = User.order(created_at: :desc).first(10)
  end

  def new
    @user = User.find_by!(nickname: params[:user_nickname])
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
    @question = Question.includes(:hashtags).find(params[:id])
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end
end
