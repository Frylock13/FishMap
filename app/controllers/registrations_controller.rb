class RegistrationsController < Devise::RegistrationsController

  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      respond_with_navigational(resource) { render :new }
    end 
  end
end