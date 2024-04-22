class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit_public update]

  def show
  end

  def edit_public
  end

  def update
    if @user.update(user_params)
      redirect_to edit_public_user_url(@user), notice: t('users.edit_public.update_success')
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
end
