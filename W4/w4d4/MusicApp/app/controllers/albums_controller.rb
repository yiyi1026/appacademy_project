class AlbumsController < ApplicationController
  before_action :require_logged_in, except: [:index]
  def new
    @album = Album.new
  end

  def index
    @albums = Album.all
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  def edit
    @album = Album.find_by(id: params[:id])
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    redirect_to albums_url
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end
end
