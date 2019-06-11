class Users::CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # @comment = @article.comments.build(comment_params)
    @comment = Comment.new(comment_params)
    @comment.article_id = @article.id
    @comment.user_id = current_user.id
    if @comment.save
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    if @comment.destroy
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :article_id, :user_id)
  end
end
