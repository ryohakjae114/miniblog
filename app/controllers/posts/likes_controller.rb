class Posts::LikesController < ApplicationController
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
