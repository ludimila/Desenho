class CoursesController < ApplicationController
  before_action :doctor_only, except: [:show]
  before_action :get_course, only: [:show, :destoy]

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
    @course.destroy
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

    def get_course
      begin
        @course = Course.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = "Curso Não Encontrado!!"
        redirect_to root_path
      rescue Exception => e
        flash[:error] = "#{e.message}. Contate o administrador do sistema."
        redirect_to root_path
      end
    end
end