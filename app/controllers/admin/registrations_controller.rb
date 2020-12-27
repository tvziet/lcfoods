class Admin::RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:admin).permit(:email, :password, :full_name)
  end

  def after_update_path_for(resource)
    debugger
  end
end
