class StaticPagesController < ApplicationController
  before_action :no_course
  def home
    if(signed_in?)
      redirect_to current_user
    end
  end
end
