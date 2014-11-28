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

    def redirect_to_resource
      redirect_to videos_path
    end

    def delete_other_resources_from_list(resource)
      @resources.delete(resource) if !resource.video?
    end

    def identify_resource
      @resource = Video.new
    end

    def notify_resource_creation(resource)
      VideoObserver.notify_creation(current_course, resource)
      flash[:success] = "Video adicionado com sucesso."
    end

    def find_repeated_resource
      if(current_course.resources.find_by(full_url: @resource.full_url))
        flash.now[:error] = "Vídeo já foi adicionado anteriormente!!"
        flash.now[:notice] = "Se quiser editar, clique em editar na descrição do vídeo."
        true
      else
        false
      end
    end
end
