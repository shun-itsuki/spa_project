class Users::ArticlesController < ApplicationController

  def index

  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    article.save
    # 一旦マイページに。作り終わったらShowpageにとばす
    redirect_to users_mypage_path(current_user.id)
  end

  def edit

  end

  def show

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
      :address,
      :latitude,
      :longitude,
      :deleted_at
    )
  end
end
