class Users::MypagesController < ApplicationController
  before_action:authenticate_user!, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: params[:id]).page(params[:page]).per(16)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_mypage_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to users_mypage_path(current_user.id)
    else
    render :edit
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:image, :name, :address, :profile)
  end
end
