class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_genres_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      new_user_session_path
    end
  end
end
