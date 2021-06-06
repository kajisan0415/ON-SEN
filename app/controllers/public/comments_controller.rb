class Public::CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = current_user.comments.new(comment_params)
    comment.article_id = article.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Comment.find_by(id: params[:id], article_id: params[:article_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
   private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
