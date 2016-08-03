class CallbacksController < Devise::OmniauthCallbacksController
  
  skip_before_filter :authenticate

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in(@user)
    redirect_to root_path
  end

  def vkontakte
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in(@user)
    redirect_to root_path
  end
end