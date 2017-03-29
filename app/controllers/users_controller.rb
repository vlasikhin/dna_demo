class UsersController < ApplicationController
  before_action :set_user, only: [:confirm_verification, :decline_verification]

  def index
    @users = User.all
  end

  def confirm_verification
    @user.confirm_verification!
  end

  def decline_verification
    @user.decline_verification!
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
