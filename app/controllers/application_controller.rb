class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def after_sign_up_path_for(resource)
    	if resource.user_role?
    		return true
    	else
    		new_user_info_path
    	end
    end


    def after_sign_in_path_for(resource)
        if resource.user_role?
            jobs_path
        else
            new_user_info_path
        end
    end
end
