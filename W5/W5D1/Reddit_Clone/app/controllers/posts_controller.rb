class PostsController < ApplicationController
  before_action :require_logged_in
  before_action :author_logged_in, only: [:edit, :update]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  # def destroy
  #   @post = Post.find(params[:id])
  #   @post.destroy
  #   redirect_to post_url(@post.sub_id)
  #
  # end
  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids:[])
  end

  def author_logged_in
    @post = Post.find(params[:id])
    redirect_to new_session_url unless @post.author == current_user
  end
end
