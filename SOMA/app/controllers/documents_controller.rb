class DocumentsController < ApplicationController
  before_action :get_menu

  def new
    @document = Document.new
  end

  def create
  end

  def index
  end

  def show
  end

  private
    def get_menu
      @MENU_OPTIONS = {documents: 2}
    end
end
