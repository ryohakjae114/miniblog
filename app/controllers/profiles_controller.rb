class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit
  end

  def update
    if @user.update(user_profile_params)
      redirect_to user_path(@user), notice: t('controller.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_profile_params
    params.require(:user).permit(:introduction, :external_blog_url)
  end
end
