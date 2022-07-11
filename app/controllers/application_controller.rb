class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Customer)
        customer_path(resource)
    else
        root_path
    end
  end


end
