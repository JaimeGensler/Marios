class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        end
    end

    def authorize(auth_type)
       send(auth_type)
   end

    private
    def user_auth
        unless is_user?
            flash[:alert] = "You aren't authorized to visit that page."
            redirect_to '/'
        end
    end
    def admin_auth
        unless is_user? && is_admin?
            flash[:alert] = "You aren't authorized to visit that page."
            redirect_to '/'
        end
    end

    def is_user?
        !current_user.nil?
    end
    def is_admin?
        current_user.admin
    end
end
