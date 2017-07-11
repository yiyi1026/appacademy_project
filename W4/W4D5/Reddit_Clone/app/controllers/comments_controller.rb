class CommentsController < ApplicationController
  before_action :require_logged_in

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit

  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

end
