class Posts::LikesController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @users = @post.liked_users
  end

  def create
    like = current_user.likes.build(post_id: params[:post_id])
    like.save!
    redirect_to posts_url
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy!
    redirect_to posts_url
  end
end
