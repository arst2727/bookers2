class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:passward,:passward_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:passward])
  end

  def after_sign_in_path_for(resource) #login後の遷移
    user_path(resource)
  end
end
