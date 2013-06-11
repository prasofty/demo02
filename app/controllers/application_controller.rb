class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_profile

  def current_user_profile
    return @current_user_profile if defined?(@current_user_profile)
    current_user.profile
  end

end
