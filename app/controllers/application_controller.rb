class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        publications_path
    end

    def authorize_request(kind = nil)
        if user_signed_in?
            unless kind.include?(current_user.role)
                redirect_to publications_path, notice: "You are not authorized to perform this action"
            end
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
