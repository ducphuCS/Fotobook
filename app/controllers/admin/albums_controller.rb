class Admin::AlbumsController < ApplicationController

  def index
    @content = Album.where
  end

  def edit
    @album = Album.find(get_album_id)
    @photo = @album.photos.new
  end

  def update
    @album = Album.find(get_album_id)
    @album.update_attributes(get_album_params)
    if @album.save
      @photo = @album.photos.new(get_photo_params)
  end


  private

  def get_album_id
    params.require(:id)
  end

  def get_album_params
    params.require(:photo).permit(:title, :description, :public)
  end

  def get_photo_params
    params.require(:photo).permit(:title, :description, :public, :image)
  end
end
