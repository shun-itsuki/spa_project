class Users::MypageLikeController < ApplicationController
  def show
    @user = User.find(params[:id])
    @like_articles = Like.where(user_id: current_user.id).page(params[:page]).per(3)
  end
end
