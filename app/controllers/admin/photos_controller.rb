class Admin::PhotosController < ApplicationController
  before_action :check_admin

  def index
    @content = Photo.where(album_id: nil).page params[:page]
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
    album_id = Photo.find(get_photo_id).album_id
    Photo.destroy(get_photo_id)
    if album_id.nil?
      redirect_to admin_photos_path(content: "photo")
    else
      redirect_to edit_admin_album_path(album_id)
    end
  end


  protected

  def check_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end


  private

  def get_photo_id
    params.require(:id)
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :public, :image)
  end
end
