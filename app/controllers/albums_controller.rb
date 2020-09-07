class AlbumsController < ApplicationController
  def edit
    # render "edit"
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
end
