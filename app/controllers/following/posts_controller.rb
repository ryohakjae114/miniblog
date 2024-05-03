class Following::PostsController < ApplicationController
  def index
    @posts = Post.where(user: current_user.following)
  end
end
