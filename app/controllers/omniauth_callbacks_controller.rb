class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    begin
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in(@user)
      redirect_to root_path
    rescue ActiveRecord::RecordNotUnique
      redirect_to :back
      flash[:danger] = 'Вы уже зарегистрированы через другую социальную сеть'
    end
  end

  def vkontakte
    begin
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in(@user)
      redirect_to root_path
    rescue ActiveRecord::RecordNotUnique
      redirect_to :back
      flash[:danger] = 'Вы уже зарегистрированы через другую социальную сеть'
    end
  end
end