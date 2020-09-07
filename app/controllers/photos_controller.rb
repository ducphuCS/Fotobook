class PhotosController < ApplicationController
  # uploader = PhotoUploader.new
  def new
    @photo = Photo.new
    @user = User.find(get_user_id)
  end
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = get_user_id
    if @photo.save
      redirect_to user_path(get_user_id)
    else
      @user = User.find(get_user_id)
      render "new"
    end
  end
  def edit
    @photo = Photo.find(get_photo_id)
    @user = User.find(@photo.user_id)
  end
  def update
    @photo = Photo.find(get_photo_id)
    @photo.update_attributes(photo_params)
  end
  def destroy
    Photo.destroy(get_photo_id)
  end

  private
  def get_user_id
    params.require(:user_id)
  end
  def photo_params
    params.require(:photo).permit(:title, :description, :sharing, :image)
  end
  def get_photo_id
    params.require(:id)
  end
end
