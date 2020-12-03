class Admin::RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:admin).permit(:email, :password, :full_name)
  end
end
