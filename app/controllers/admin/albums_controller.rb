class Admin::AlbumsController < ApplicationController

  def index
    @content = Album.page params[:page]
  end

  def edit
    @album = Album.find(get_album_id)
    @photo = @album.photos.new
  end

  def update
    @album = Album.find(get_album_id)
    if @album.update_attributes(get_album_params)
      @photo = @album.photos.new(get_photo_params)
      if @photo.image.file.nil?
        redirect_to edit_admin_album_path(@album.id)
      else
        @photo.user_id = @album.user_id
        if @photo.save
          redirect_to edit_admin_album_path(@album.id)
        else
          render "edit"
        end
      end
    else
      render "edit"
    end
  end

  def destroy
    Album.destroy(get_album_id)
    redirect_to admin_albums_path
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
