class SessionsController < ApplicationController
  def new
    if(signed_in?)
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(login: params[:session][:login].downcase)
    if(user and user.authenticate(params[:session][:password]))
      if(user.activated?)
        sign_in(user)
        redirect_back_or(user)
      else
        redirect_to root_path, notice: "Sua conta ainda não foi ativada. Entre em contato com o administrador do sistema."
      end
    else
      flash.now[:error] = "Email/Senha incorretos"
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end

