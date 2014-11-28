class VideosController < ResourcesController
  def new
    @resource = Video.new
  end

  private
    def video_params
      params.require(:video).permit(:description, :full_url)
    end

    def notify_resource_destruction(resource)
      VideoObserver.notify_destruction(current_course, resource)
    end

    def redirect_to_resources_page
      redirect_to videos_path
    end

    def delete_other_resources_from_list(resource)
      @resources << resource if resource.video?
    end

    def identify_resource
      @resource = Video.new(video_params)
    end

    def notify_resource_creation(resource)
      VideoObserver.notify_creation(current_course, resource)
      flash[:success] = "Video adicionado com sucesso."
    end

    def find_repeated_resource
      if(current_course.resources.find_by(document_file_name: @resource.full_url))
        flash.now[:error] = "Vídeo já foi adicionado anteriormente!!"
        flash.now[:notice] = "Se quiser editar, clique em editar na descrição do vídeo."
        true
      else
        false
      end
    end

    def paginate_resource
      @resources = @resources.paginate(page: params[:page], per_page: Video.per_page)
    end

    def find_resource
      @resource = Video.find(params[:id])
    end
end
