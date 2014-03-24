class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Authem::ControllerSupport

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def success_action
    action_name == "create" ? "added" : "updated"
  end
  hide_action(:success_action)
end
