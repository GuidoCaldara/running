class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    '/complete_profile' # Or :prefix_to_your_route
  end

  def update_resource(resource, params)
  # Require current password if user is trying to change password.
    return super if params["password"]&.present?

    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end

end
