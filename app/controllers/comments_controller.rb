class CommentsController < ApplicationController
  before_action :set_comment

  def show
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
