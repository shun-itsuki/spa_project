class Users::MypagesController < ApplicationController
  def show
    @user = User.find(params[:id])
    #binding.pry
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_mypage_path(current_user.id)
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:image, :name, :address, :profile)
  end

end
