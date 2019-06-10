class Users::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    # binding.pry
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    article.save
    redirect_to users_article_path(article.id)
  end

  def edit

  end

  def show
    @article = Article.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
  def article_params
    params.require(:article).permit(
      :user_id,
      :spa_name,
      :date,
      :article_image,
      :impression,
      :value,
      :spa_address,
      :latitude,
      :longitude,
      :deleted_at
    )
  end
end
