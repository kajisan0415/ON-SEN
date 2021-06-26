class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      articles_path
    when User
      user_path(current_user)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      root_path
    else
      root_path
    end
  end
end
