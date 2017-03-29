class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :ban_user?

  def ban_user?
    return unless current_user.present? && current_user.ban_user?
      sign_out current_user
      flash[:error] = 'Этот аккаунт заблокирован...'
      root_path
  end
end
