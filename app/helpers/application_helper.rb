module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when :alert then 'alert-error'
    when :notice then 'alert-success'
    end
  end

  def resource_name
    :user
end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    User
  end
end
