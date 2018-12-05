class ProfilesController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    set_user
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :photo, :email)
  end
end


