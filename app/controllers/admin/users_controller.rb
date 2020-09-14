class Admin::UsersController < ApplicationController
  before_action :check_admin

  def index
    @content = User.where.not(id: current_user.id).page params[:page]
  end

  def edit
    @user = User.find(get_user_id)
  end

  def update
    @user = User.find(get_user_id)
    @user.update_attributes(user_params)
    redirect_to admin_users_path
  end

  def destroy
      User.destroy(get_user_id)
      redirect_to admin_user_path
  end


  protected

  def check_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end


  private

  def get_user_id
    params.require(:id)
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :active)
  end
end
