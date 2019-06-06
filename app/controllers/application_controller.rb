class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

# from_nagareco

  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     admins_top_index_path
  #   when User
  #     users_mypage_index_path
  #   end
  # end
  #
  # def after_sign_out_path_for(resource)
  #     root_path
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    devise_parameter_sanitizer.permit(:sign_up,keys:[:address])
    devise_parameter_sanitizer.permit(:sign_up,keys:[:deleted_at])
  end

end
