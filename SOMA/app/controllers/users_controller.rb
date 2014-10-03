class UsersController < ApplicationController
  require "httparty"

  before_action :signed_in_user, except: [:new, :create]
  before_action :get_user, except: [:new, :create, :index]
  before_action :admin_only, except: [:new, :create, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = "provisoria"

    if(!params[:user][:zip_code].blank?)
      @user = get_address(params[:user][:zip_code], @user)
    end

    if(@user.login.blank?)
      @user.login = @user.email
    end
    if(@user.save)
      flash[:success] = "Sua conta será ativada assim que recebermos a confirmação do seu pagamento."
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
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
    
  private
    def user_params
      params.require(:user).permit(:name, :rg, :issuing_agency, :cpf, :phone1, :phone2, :zip_code, :email, :street, :number, :district, :city, :state)
    end

    def edit_params
      params.require(:user).permit(:name, :phone1, :phone2, :zip_code, :email, :number, :state) 
    end

    def user_login
      params.require(:user).permit(:login, :password, :password_confirmation)
    end
    def get_user
      @user = User.find(params[:id])
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
