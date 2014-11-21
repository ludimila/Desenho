class DocumentsController < ApplicationController
  include ApplicationHelper
  before_action :get_menu

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if(current_course.documents.find_by(document_file_name: @document.document_file_name))
      flash.now[:error] = "Documento já foi adicionado anteriormente!!"
      flash.now[:notice] = "Se for um documento diferente, mude o nome do arquivo e tente novamente"
      render "new"
    elsif(@document.save)
      current_course.documents << @document
      DocumentObserver.notify_creation(current_course, @document)
      flash[:success] = "Documento adicionado com sucesso."
      redirect_to documents_path
    else
      render "new"
    end
  end

  def index
    @documents = current_course.documents
  end

  def show
  end

  private
    def get_menu
      @MENU_OPTIONS = {documents: 2}
    end

    def document_params
      params.require(:document).permit(:document, :description)
    end
end
