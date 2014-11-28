class ResourcesController < ApplicationController
  include ApplicationHelper
  before_action :get_menu

  def create
    identify_resource
    found = find_repeated_resource
    if(@resource.save and !found)
      current_course.resources << @resource
      notify_resource_creation(@resource)
      redirect_to_resources_page
    else
      render "new" and return
    end
  end

  def destroy
    find_resource
    if(@resource.destroy)
      notify_resource_destruction(@resource)
      flash[:success] = "Recurso removido com sucesso!"
    else
      flash[:error] = "Recurso não pôde ser excluído. Contate o administrador do sistema."
    end
    redirect_to_resources_page
  end

  def index
    @resources = current_course.resources
    @resources.each do |res|
      delete_other_resources_from_list(res)
    end
  end

  private
    def get_menu
      @MENU_OPTIONS = { documents: 2, videos: 3, questions: 4 }
    end

    def notify_resource_destruction(resource)
    end

    def redirect_to_resource
    end

    def delete_other_resources_from_list(resource)
    end

    def identify_resource
    end

    def notify_resource_creation(resource)
    end

    def find_repeated_resource
      false
    end
end
