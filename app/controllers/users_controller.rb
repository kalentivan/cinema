class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили форму регистрации'
      render :new
    end
  end

  def edit
    if params[:id] == session[:user_id].to_s 
      @user = User.find(params[:id])
    else 
      redirect_to root_path
    end
  end

  def update
    if params[:id] == session[:user_id].to_s 
      data = user_params
      @user = User.find(params[:id])

      if data[:password] == ""
        data[:password] = @user.password_digest
        data[:password_confirmation] = @user.password_digest
      end
      
      if @user.update(data)
        redirect_to root_path, notice: 'Данные успешно изменены!'
      else
        flash.now[:alert] = 'Вы неправильно заполнили форму регистрации'
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if params[:id] == session[:user_id].to_s 
      @user = User.find(params[:id])
      @user.destroy
      session.delete(:user_id)
      redirect_to root_path, notice: 'Пользователь удален!'
    else
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation
    )
  end
end
