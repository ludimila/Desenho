class QuestionsController < ApplicationController
  include ApplicationHelper
  before_action :get_menu

  def new
    @question = Question.new
    answers = Array.new
    @question.options_amount.times do |a|
      a = QuestionOption.new
      answers << a
    end
    @question.question_options = answers
  end

  def create
    @question = Question.create(question_params)
    render "new"
  end

  def index
  end

  private
    def question_params
      params.require(:question).permit(:command, :right_answer, :question_options_attributes)
    end
    
    def get_menu
      @MENU_OPTIONS = {questions: 4}
    end

end
