class StudentsController < UsersController
  def new
    @user = Student.new
  end

  def create
    @user = Student.new(user_params)
    @user.password = "provisoria"

    if(!params[:student][:zip_code].blank?)
      @user = get_address(params[:student][:zip_code], @user)
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

  private
    def user_params
      params.require(:student).permit(:name, :rg, :issuing_agency, :cpf, :phone1, :phone2, :zip_code, :email, :street, :number, :district, :city, :state)
    end

    def edit_params
      params.require(:student).permit(:name, :phone1, :phone2, :zip_code, :email, :number, :state, :complement) 
    end

    def user_login
      params.require(:student).permit(:login, :password, :password_confirmation)
    end


end
