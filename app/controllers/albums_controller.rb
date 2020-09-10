class AlbumsController < ApplicationController

  def new
    @album = current_user.albums.new()
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      redirect_to new_user_album_path(user_id: get_user_id)
    else
      render "new"
    end
  end

  def edit
    @album = current_user.albums.find(get_album_id)
  end

  def update
    value = albums_title
    @album = current_user.album.find(get_album_id)
    @album.title = value
    if @album.update(title: value)
      flash[:title_change_error] = nil
      render "show"
    else
      flash[:title_change_error] = @album.errors.messages[:title][0]
      redirect_to action: :edit
    end
  end


  private

  def albums_title
    params.require(:album).permit(:title)[:title]
  end

  def get_user_id
    params.require(:user_id)
  end

  def get_album_id
    params.require(:id)
  end

end
