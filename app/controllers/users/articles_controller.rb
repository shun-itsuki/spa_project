class Users::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @articles = Article.page(params[:page]).per(16)
    @like_ranking = Article.where(created_at:1.month.ago..Time.now).order(likes_count: "DESC").limit(4)
    # 下記の命令文はsqlite3のもののため、本番環境では修正する。
    @recommendations = Article.order("RANDOM()").limit(4)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to users_article_path(@article.id)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    if @article.user != current_user
      redirect_to users_mypage_path(current_user.id)
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
    @hash = Gmaps4rails.build_markers(@article) do |article, marker|
      marker.lat article.latitude
      marker.lng article.longitude
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
    redirect_to users_article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to users_mypage_path(current_user.id)
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
