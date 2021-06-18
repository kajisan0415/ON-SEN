class Public::StampsController < ApplicationController
  before_action :authenticate_user!
  def create
    @article = Article.find(params[:article_id])
    stamp = current_user.stamps.new(article_id: @article.id)
    stamp.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @article = Article.find(params[:article_id])
    stamp = current_user.stamps.find_by(article_id: @article.id)
    stamp.destroy
    #redirect_back(fallback_location: root_path)
  end
end
