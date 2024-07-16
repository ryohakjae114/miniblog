class Following::PostsController < ApplicationController
  def index
    @posts = Post.where(user: current_user.following_ids).order(created_at: :desc).includes(:user, picture_attachment: :blob)
  end
end
