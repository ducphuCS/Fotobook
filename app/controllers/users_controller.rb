class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :guest

  def show
    @user = User.find(get_user_id)
  end

  def feed
    @content_type = get_content
    if @content_type == "photo"
      @content = Photo.where(album_id: nil).where("user_id = ? and  public = ? or user_id = ?",current_user.followees.ids ,true, current_user.id).includes(:user).order(updated_at: :desc)
    else
      @content = Album.where(user_id: current_user.followees.ids, public: true).or(Album.where(user_id: current_user.id)).includes(:user).order(updated_at: :desc)
    end
  end

  def discover
    @content_type = get_content
    if @content_type == "photo"
      @content = Photo.where(album_id: nil).where("public = ? or user_id = ?",true, current_user.id).includes(:user).order(updated_at: :desc)
    else
      @content = Album.where(public: true).or(Album.where(user_id: current_user.id)).includes(:user).order(updated_at: :desc)
    end
  end

  def guest
    @content_type = get_content
    if @content_type == "photo"
      @content = Photo.where("album_id = ? and public = ?", nil, true).includes(:user).order(updated_at: :desc)
    else
      @content = Album.where(public: true).includes(:user).order(updated_at: :desc)
    end
  end

  def toggle_follow
    follower_id = get_follower_id
    followee_id = get_followee_id
    follow = Follow.where(follower_id: follower_id, followee_id: followee_id)
    if follow.blank?
      Follow.create(follower_id: follower_id, followee_id: followee_id)
    else
      Follow.destroy_by(follower_id: follower_id, followee_id: followee_id)
    end
    render "toggle_follow", locals: {id: followee_id}
  end

  def toggle_like
    user_id = current_user.id
    content_id = get_content_id
    content_type = get_content_type
    like = Like.where(user_id: user_id, content_id: content_id, content_type: content_type)
    if like.blank?
      Like.create(user_id: user_id, content_id: content_id, content_type: content_type)
    else
      Like.destroy_by(user_id: user_id, content_id: content_id, content_type: content_type)
    end
    render "toggle_like", locals: {id: content_id}
  end



  def liked(content_id, content_type)
    !Like.where(content_id: content_id, user_id: current_user.id, content_type: content_type).blank?
  end

  def followed(follower_id, followee_id)
    !Follow.where(follower_id: follower_id, followee_id: followee_id).blank?
  end

  helper_method :followed, :liked



  private

  def get_content_type
    params.require(:content_type)
  end

  def get_content_id
    params.require(:content_id)
  end

  def get_follower_id
    params.require(:follower_id)
  end

  def get_followee_id
    params.require(:followee_id)
  end

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
