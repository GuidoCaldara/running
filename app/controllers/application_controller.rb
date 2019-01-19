class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery

  private

  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

  def after_sign_in_path_for(_resource_or_scope)
    if URI.parse(request.referer).path == '/users' || URI.parse(request.referer).path == '/users/sign_in' || URI.parse(request.referer).path == '/users/password/edit' ||
       URI.parse(request.referer).path == '/users/sign_up'
      root_path
    else
      URI.parse(request.referer).path if request.referer
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])
  end
end
