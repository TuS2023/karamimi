class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
