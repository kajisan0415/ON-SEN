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
