class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(
        :name,
        :surname,
        :patronymic,
        :phone_number,
        :city,
        :address,
        :email,
        :password,
        :password_confirmation,
        :document_scan
    )
  end

  def account_update_params
    params.require(:user).permit(
        :name,
        :surname,
        :patronymic,
        :phone_number,
        :city,
        :address,
        :email,
        :password,
        :password_confirmation
    )
  end
end
