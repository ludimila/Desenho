class ResourcesController < ApplicationController
  include ApplicationHelper
  require "will_paginate/array"
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
    validate_search
    if(@resource.destroy)
      notify_resource_destruction(@resource)
      flash[:success] = "Recurso removido com sucesso!"
    else
      flash[:error] = "Recurso não pôde ser excluído. Contate o administrador do sistema."
    end
    redirect_to_resources_page
  end

  def index
    resources = current_course.resources
    @resources = []
    resources.each do |res|
      delete_other_resources_from_list(res)
    end
    paginate_resource
  end

  private
    def get_menu
      @MENU_OPTIONS = { documents: 2, videos: 3, questions: 4 }
    end

    def notify_resource_destruction(resource)
    end

    def redirect_to_resources_page
    end

    def delete_other_resources_from_list(resource)
    end

    def identify_resource
    end

    def notify_resource_creation(resource)
    end

    def find_resource
    end

    def find_repeated_resource
      false
    end

    def paginate_resource
      @resources = @resources.paginate(page: params[:page], per_page: Resource.per_page)
    end

    def validate_search
      begin
        find_resource
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = "Recurso Não Encontrado!!"
        redirect_to root_path
      rescue Exception => e
        flash[:error] = "#{e.message}. Contate o administrador do sistema."
        redirect_to root_path
      end
    end

end
