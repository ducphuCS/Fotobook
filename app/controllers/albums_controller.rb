class AlbumsController < ApplicationController

  def new
    @album = current_user.albums.new()
    @photo = @album.photos.new()
  end

  def create
    @album = current_user.albums.new(album_params)
    @album.save
    @photo = @album.photos.new( photo_params )
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to edit_album_path(@album.id)
    else
      Album.destroy(@album.id)
    end
  end

  def edit
    if current_user.admin
      @album = Album.find(get_album_id)
    else
      @album = current_user.albums.find(get_album_id)
    end
    @photo = @album.photos.new()
  end

  def update
    if current_user.admin
      @album = Album.find(get_album_id)
    else
      @album = current_user.albums.find(get_album_id)
    end
    if @album.save
      @photo = @album.photos.new( photo_params)
      @photo.user_id = current_user.id
      if @photo.save
        redirect_to edit_album_path(@album.id)
      else
        render "edit"
      end
    else
      render "edit"
    end
  end

  def destroy
    if current_user.admin
      @album = Album.find(get_album_id)
      Album.destroy(@album.id)
      redirect_to admin_path
    else
      @album = current_user.albums.find(get_album_id)
      Album.destroy(@album.id)
      redirect_to user_path(id: current_user.id)
    end
  end


  private

  def photo_params
    params.require(:photo).permit(:title, :description, :public, :image)
  end

  def album_params
    params.require(:photo).permit(:title, :description, :public)
  end

  def get_user_id
    params.require(:user_id)
  end

  def get_album_id
    params.require(:id)
  end

end
