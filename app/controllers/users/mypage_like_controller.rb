class Users::MypageLikeController < ApplicationController
  def show
    # binding.pry
    @user = User.find(params[:id])
    @likes = Like.where(user_id: params[:id]).page(params[:page]).per(16)
  end
end
