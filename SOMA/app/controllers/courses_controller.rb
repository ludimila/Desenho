class CoursesController < ApplicationController
  before_action :doctor_only, except: [:show]

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
    begin
      @course = Course.find(params[:id])
    rescue Exception => e
      flash[:error] = "Curso Não encontrado!!!"
      redirect_to root_path
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Curso excluído com sucesso."
    redirect_to current_user
  end

  private

    def course_params
      params[:course][:doctor_id] = current_user.id
      params.require(:course).permit(:doctor_id, :name, :workload)
    end

    def doctor_only
      if(!current_user.is_a?(Doctor))
        flash[:error] = "Você não tem permissão para realizar esta operação. Contate o administrador do sistema."
        redirect_to current_user
      end
    end
end
