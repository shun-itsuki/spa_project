class Users::LikesController < ApplicationController
  before_action :set_article

  def create
    @like = Like.create(user_id: current_user.id, article_id: params[:article_id])
    @article.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    like.destroy
    @article.reload
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
