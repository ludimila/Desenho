class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def signed_in_user
    if(!signed_in?)
      store_location
      redirect_to signin_url, notice: "Por favor, entre primeiro"
    end
  end

end
