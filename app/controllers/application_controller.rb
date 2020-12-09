class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pagy::Backend
  after_action :return_errors, only: %i[page_not_found server_error]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def page_not_found
    @status   = 404
    @layout   = 'application'
    @template = 'not_found_error'
  end

  def server_error
    @status   = 500
    @layout   = 'error'
    @template = 'internal_server_error'
  end

  private

  def return_errors
    respond_to do |format|
      format.html { render template: 'errors/' + @template, layout: 'layouts/' + @layout, status: @status }
      format.all  { render nothing: true, status: @status }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :company_id)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password, company_id)}
  end
end
