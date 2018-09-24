class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
    	if current_user.blank?
        	redirect_to main_app.new_user_session_url, alert: exception.message
    	else
        	redirect_to main_app.root_url, alert: exception.message
        end
    end
end