class UsersController < ApplicationController
  require "httparty"
  require "will_paginate/array"

  before_action :admin_only, only: [:index, :activate, :deactivate, :destroy]
  before_action :signed_in_user, except: [:new, :create]
  before_action :get_user, except: [:new, :create, :index]

  def show
  end

  def edit
  end

  def update
    if(@user.update(edit_params))
      flash[:success] = "Atualização feita com sucesso."
      redirect_to @user
    else
      render "edit"
    end
  end

  def update_login
    if(@user.update(user_login))
      flash[:success] = "Login/senha alterados com sucesso!"
      redirect_to @user
    else
      flash.now[:error] = "Login/senha não puderam ser alterados. Contate o administrador do sistema."
      render "edit_login"
    end
  end

  def edit_login
  end

  def destroy
    @user.destroy
    flash[:success] = "Usuário excluído com sucesso."
    redirect_to users_url
  end

  def activate
    if(@user.update_columns(activated: true, activated_at: Date.current))
      flash[:success] = "O usuario '#{@user.name}' foi ativado com sucesso."
    else
      flash[:error] = "O usuario '#{@user.name}' nao pode ser ativado."
    end
    redirect_to users_path
  end

  def deactivate
    if(@user.update_columns(activated: false, activated_at: nil))
      flash[:notice] = "O usuario '#{@user.name}' foi desativado com sucesso."
    else
      flash[:error] = "O usuario '#{@user.name}' nao pode ser desativado."
    end
    redirect_to users_path
  end


  private
    def admin_only
      if(!current_user.admin?)
        flash[:error] = "Você não tem permissão para realizar esta operação. Contate o administrador do sistema."
        redirect_to current_user
      end
    end

    def get_user
      @user = User.find(params[:id])          
    end

    def find_regex(regex)
      ids = []
      if(!regex.blank?)
        regex = /#{regex}/i
        User.all.each do |user|
          if(user.name =~ regex)
            ids << user.id
          end
        end
      end
      ids
    end

    def get_address(zip_code, user)
      if(!zip_code.blank?)
        address = HTTParty.get("http://cep.correiocontrol.com.br/#{zip_code}.json")
        if(!address.blank?)
          user.street = address["logradouro"]
          user.district = address["bairro"]
          user.city = address["localidade"]
          user.state = address["uf"]
        end
      end
      user
    end
end
