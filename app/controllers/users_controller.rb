class UsersController < ApplicationController
  before_action :set_user, only: %i[show profile update]
  before_action :authenticate_current_user!, only: :update

  def show
  end

  def profile
  end

  def update
    if @user.update(user_params)
      redirect_to profile_user_path(@user), notice: t('users.edit_public.update_success')
    else
      render :edit_public, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:introduction, :external_blog_url)
  end

  def authenticate_current_user!
    unless current_user == @user
      redirect_to root_url
    end
  end
end
