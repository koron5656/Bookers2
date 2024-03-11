class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "プロフィール更新に成功しました。"
    redirect_to user_path(@user.id)
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
end