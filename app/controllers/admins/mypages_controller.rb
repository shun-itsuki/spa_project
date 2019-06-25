class Admins::MypagesController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
  end
end
