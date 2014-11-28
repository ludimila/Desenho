class QuestionsController < ResourcesController 
  def new
    @resource = Question.new
    answers = Array.new
    @resource.options_amount.times do |a|
      a = QuestionOption.new
      answers << a
    end
    @resource.question_options = answers
  end

  private
    def question_params
      params.require(:question).permit(:description)
    end

    def notify_resource_destruction(resource)
      QuestionObserver.notify_destruction(current_course, resource)
    end

    def redirect_to_resources_page
      redirect_to questions_path and return
    end

    def delete_other_resources_from_list(resource)
      @resources.delete(resource) if !resource.question?
    end

    def identify_resource
      @resource = Question.new(question_params)
    end

    def find_repeated_resource
      false
    end

    def notify_resource_creation(resource)
      QuestionObserver.notify_creation(current_course, resource)
      flash[:success] = "Questão adicionada com sucesso."
    end

    def find_resource
      @resource = Question.find(params[:id])
    end
end
