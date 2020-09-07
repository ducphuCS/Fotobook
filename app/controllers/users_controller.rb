class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    puts "User create action"

    if @user.save
      UserMailer.welcome_mail(@user).deliver_now
    end
  end
  def show

  end
  def feed

  end
  def discover
    @content_type = get_content
    @user = User.find(get_user_id)
    if @content_type == "photo"
      @content = Photo.includes(:user).order(updated_at: :desc)
    else
      @content = Album.includes(:user, :photos).order(updated_at: :desc)
    end
  end

  private
  def get_content
    if params[:content].present?
      params.require(:content)
    else
      "photo"
    end
  end
  def get_user_id
    if params[:id].present?
      params.require(:id)
    else
      current_user.id
    end
  end
end
