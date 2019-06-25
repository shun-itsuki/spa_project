class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(16)
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: params[:id]).page(params[:page]).per(16)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
       redirect_to admins_user_path(user.id)
    else
       render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_user_index_path
  end

  private
  def user_params
    params.require(:user).permit(:image, :name, :address, :profile)
  end
end
