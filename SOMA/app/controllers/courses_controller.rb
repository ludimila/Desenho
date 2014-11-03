class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if(@course.save)
      flash[:success] = "Novo curso criado com sucesso!"
      redirect_to @course
    else
      render "new"
    end
  end

  def show
  end

  def destroy
  end

  private

    def course_params
      params[:course][:doctor_id] = current_user.id
      params.require(:course).permit(:doctor_id, :name, :workload)
    end

end
