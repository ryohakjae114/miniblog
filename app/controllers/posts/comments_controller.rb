class Posts::CommentsController < ApplicationController
  before_action :set_post

  def new
    @comment = @post.comments.build(user: current_user)
  end

  def create
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      UserMailer.with(comment: @comment).commented.deliver_now if @post.user.email.present?
      redirect_to post_path(@post), notice: t('controller.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
