class PhotosController < ApplicationController

  def new
    @photo = current_user.photos.new()
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to user_path(current_user.id)
    else
      render "new"
    end
  end

  def edit
    @photo = current_user.photos.find(get_photo_id)
  end

  def update
    @photo = current_user.photos.find(get_photo_id)
    @photo.update_attributes(photo_params)
    redirect_to user_path(id: current_user.id)
  end

  def destroy
    @photo = current_user.photos.find(get_photo_id)
    Photo.destroy(@photo.id)
    redirect_to user_path(id: current_user.id)
  end


  private

  def photo_params
    params.require(:photo).permit(:title, :description, :public, :image)
  end

  def get_photo_id
    params.require(:id)
  end

end
