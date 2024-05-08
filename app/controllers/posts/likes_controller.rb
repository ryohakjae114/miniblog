class Posts::LikesController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @users = @post.liked_users
  end

  def create
    current_user.likes.create!(post_id: params[:post_id])
    redirect_to posts_url
  end

  def destroy
    current_user.likes.find(params[:id]).destroy!
    redirect_to posts_url
  end
end
