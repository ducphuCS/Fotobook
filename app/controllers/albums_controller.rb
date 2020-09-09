class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @user = User.find(get_user_id)
  end
  def create
    @album = Album.new(photo_params)
    @album.user_id = get_user_id
    if @album.save
      redirect_to new_user_album_path(user_id: get_user_id)
    else
      @user = User.find(get_user_id)
      render "new"
    end
  end
  def edit
    @album = Album.find(params[:id])
  end
  def update
    value = albums_title
    @album = Album.find(params[:id])
    @album.title = value
    if @album.update(title: value)
      flash[:title_change_error] = nil
      render "show"
    else
      flash[:title_change_error] = @album.errors.messages[:title][0]
      # render :edit
      redirect_to action: :edit
    end
  end
  def show
    @album = Album.find(params[:id])
    render "show"
  end

  private
  def albums_title
    params.require(:album).permit(:title)[:title]
  end
  def get_user_id
    params.require(:user_id)
  end
end
