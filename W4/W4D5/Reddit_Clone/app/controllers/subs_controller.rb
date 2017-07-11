class SubsController < ApplicationController
  before_action :require_logged_in
  before_action :mod_logged_in, only:[:edit, :update]

  def mod_logged_in
    @sub = Sub.find(params[:id])
    redirect_to new_session_url unless @sub.moderator == current_user
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.moderated_subs.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end


  def edit
    # @sub = current_user.moderated_subs.find(params[:id])
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end




  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
