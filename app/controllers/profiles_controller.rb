class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :trips]

  def show
    set_user
    @trips = current_user.trips
  end

  def trips
    @trips = user.trips
  end


    private

    def set_user
      @user = User.find(current_user.id)
    end

    def user_params
      params.require(:user).permit(:first_name, :email, :photo, :email)
    end
  end
