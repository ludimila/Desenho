class VideosController < ResourcesController
  def new
    @resource = Video.new
  end
end
