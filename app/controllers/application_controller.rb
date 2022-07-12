class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Customer)
        mypage_path
    else
        root_path
    end
  end


end
