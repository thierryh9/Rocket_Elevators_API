class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to main_app.root_path, :alert => exception.message
	end

end
