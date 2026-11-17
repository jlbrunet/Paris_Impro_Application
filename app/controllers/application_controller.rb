class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :status, :course_id])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :status,:course_id])
  end

  private

  # A student can't book more rattrapages than declared absences (max 9).
  def require_rattrapage_left
    return unless current_user.status == "student"
    return if current_user.rattrapage_left?

    redirect_to root_path, alert: "Tu n'as plus d'absence à rattraper."
  end
end
