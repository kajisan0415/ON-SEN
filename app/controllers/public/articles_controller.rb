class Public::ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.user_id = current_user.id
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def search
  @articles = Article.search(params[:keyword])
  @keyword = params[:keyword]
  render "search"
  end
  
  def ranking
    @all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
    @stamp_ranks = Article.find(Stamp.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
  end

private

  def article_params
    params.require(:article).permit(:name,
    :image,
    :prefecture_code,
    :address_city,
    :address_street,
    :address_building,
    :site_url,
    :tax,
    :opening_hours,
    :closed,
    :introduction
    )
  end


end
