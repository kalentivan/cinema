class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])
    user&.authenticate(user_params[:password])
    
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Вы вошли на сайт'
    else
      flash.now[:alert] = 'Неправильный пароль или email'
      render :new
    end
  end
  
  def destroy
    if session[:session] != nil
      session.delete(:user_id)
      redirect_to root_path, notice: 'Вы вышли с сайта'
    else
      redirect_to root_path
    end
  end
end
