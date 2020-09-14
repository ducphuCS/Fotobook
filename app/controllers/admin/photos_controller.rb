class Admin::PhotosController < ApplicationController

  def index
    @content = Photo.where(album_id: nil)
  end

  def edit
    @photo = Photo.find(get_photo_id)
  end

  def update
    @photo = Photo.find(get_photo_id)
    @photo.update_attributes(photo_params)
    redirect_to admin_path(content: "photo")
  end

  def destroy
    Photo.destroy(get_photo_id)
    redirect_to admin_path(content: "photo")
  end

  private

  def get_photo_id
    params.require(:id)
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :public, :image)
  end
end
