class UsersController < ApplicationController
  before_action :get_user, :signed_in_user, :admin_only, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = "provisoria"
    @user.login = @user.name.parameterize
    if(@user.save)
      flash[:success] = "Sua conta será ativada assim que recebermos a confirmação do seu pagamento."
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def index
  end

  def activate
    if(@user.update_columns(activated: true, activated_at: Time.now))
      flash[:success] = "O usuario '#{@user.name}' foi ativado com sucesso."
    else
      flash[:error] = "O usuario '#{@user.name}' nao pode ser ativado."
    end
    redirect_to current_user
  end

  def deactivate
    if(@user.update_columns(activated: false, activated_at: nil))
      flash[:success] = "O usuario '#{@user.name}' foi desativado com sucesso."
    else
      flash[:error] = "O usuario '#{@user.name}' nao pode ser desativado."
    end
    redirect_to current_user
  end

  private
    def user_params
      params.require(:user).permit(:name, :rg, :issuing_agency, :cpf, :phone1, :phone2, :zip_code, :email) 
    end

    def get_user
      @user = User.find(params[:id])
    end

    def admin_only
      if(!current_user.admin?)
        flash[:error] = "Você não tem permissão para realizar esta operação. Contate o administrador do sistema."
        redirect_to current_user
      end
    end
end
