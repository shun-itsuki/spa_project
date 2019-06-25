class Admins::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @articles = Article.page(params[:page]).per(16)
  end

  def show
    @article = Article.find(params[:id])
    # @comments = Comment.where(article_id:params[:id])
    @hash = Gmaps4rails.build_markers(@article) do |article, marker|
      marker.lat article.latitude
      marker.lng article.longitude
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to admins_articles_path
  end
end
