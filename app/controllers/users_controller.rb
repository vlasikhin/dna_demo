class UsersController < ApplicationController
  before_action :set_user, only: [
      :confirm_verification,
      :decline_verification,
      :ban_user,
      :cancel_ban_user
  ]

  def index
    @users = User.all
  end

  def confirm_verification
    @user.confirm_verification!
  end

  def decline_verification
    @user.decline_verification!
  end

  def ban_user
    @user.ban_user!
  end

  def cancel_ban_user
    @user.cancel_ban_user!
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
