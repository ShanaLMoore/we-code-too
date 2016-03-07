class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:show, :show_by_name]

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def logged_in?
    !current_user.nil? && !current_user.id.nil?
  end
  helper_method :logged_in?
end
