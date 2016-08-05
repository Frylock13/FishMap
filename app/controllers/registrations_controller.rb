class RegistrationsController < Devise::RegistrationsController

 prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

def create
  begin
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  rescue ActiveRecord::RecordNotUnique
    redirect_to :back
    flash[:danger] = 'Вы уже зарегистрированы через другую социальную сеть'
  end
end

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