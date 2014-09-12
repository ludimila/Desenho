module SessionsHelper
  def sign_in(user)
    session[:remember_token] = user.id
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user = User.find_by(session[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !session[:remember_token].nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    session[:remember_token] = nil
    self.current_user = nil
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    if request.get?
      session[:return_to] = request.url
    end
  end
end
