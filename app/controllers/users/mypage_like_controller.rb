class Users::MypageLikeController < ApplicationController
  before_action:authenticate_user!

  def show
    @user = User.find(params[:id])
    @likes = Like.where(user_id: params[:id]).page(params[:page]).per(16)
  end
end
