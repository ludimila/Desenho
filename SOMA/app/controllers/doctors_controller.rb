class DoctorsController < UsersController
  
  def index
    users_ids = find_regex(params[:search])
    if(users_ids.blank?)
      @users = User.all
      if(!params[:search].blank?)
        flash.now[:notice] = "Não foi encontrado nenhum usuário com o nome #{params[:search]}. Exibindo todos os usuários."
      end
    else
      @users = User.find(users_ids)
    end
    @users = @users.paginate(:page => params[:page])
  end

  private
    def edit_params
      params.require(:doctor).permit(:name, :phone1, :phone2, :zip_code, :email, :number, :state, :complement) 
    end

    def user_login
      params.require(:doctor).permit(:login, :password, :password_confirmation)
    end

end
