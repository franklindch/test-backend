class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
