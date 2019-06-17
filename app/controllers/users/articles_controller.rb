class Users::ArticlesController < ApplicationController

  def index
    @articles = Article.all.page(params[:page]).per(3)
    # binding.pry
    @like_ranking = Article.where(created_at:1.month.ago..Time.now).order(likes_count: "DESC").limit(4)
    @recommendations = Article.order("RANDOM()").limit(4)
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
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
    # binding.pry
    @comment = Comment.new
    @comments = @article.comments
    @hash = Gmaps4rails.build_markers(@article) do |article, marker|
      marker.lat article.latitude
      marker.lng article.longitude
    end
    # binding.pry
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to users_article_path(article.id)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
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
