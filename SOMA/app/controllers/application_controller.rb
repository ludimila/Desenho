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

  def admin_only
    if(!current_user.admin?)
      flash[:error] = "Você não tem permissão para realizar esta operação. Contate o administrador do sistema."
      redirect_to current_user
    end
  end

end
