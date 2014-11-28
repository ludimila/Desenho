class DocumentsController < ResourcesController
  def new
    @resource = Document.new
  end

  private
    def document_params
      params.require(:document).permit(:document, :description)
    end

    def notify_resource_destruction(resource)
      DocumentObserver.notify_destruction(current_course, resource)
    end

    def redirect_to_resources_page
      redirect_to documents_path and return
    end

    def delete_other_resources_from_list(resource)
      @resources.delete(resource) if !resource.document?
    end

    def identify_resource
      @resource = Document.new(document_params)
    end

    def find_repeated_resource
      if(current_course.resources.find_by(document_file_name: @resource.document_file_name))
        flash.now[:error] = "Documento já foi adicionado anteriormente!!"
        flash.now[:notice] = "Se for um documento diferente, mude o nome do arquivo e tente novamente"
        true
      else
        false
      end
    end

    def notify_resource_creation(resource)
      DocumentObserver.notify_creation(current_course, resource)
      flash[:success] = "Documento adicionado com sucesso."
    end

    def find_resource
      @resource = Document.find(params[:id])
    end
end
