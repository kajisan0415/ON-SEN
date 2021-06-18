class Admin::ArticlesController < ApplicationController
before_action :authenticate_admin!

  def show
    @article = Article.find(params[:id])
    gon.article = @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.admin_id = current_admin.id
    if @article.save
      redirect_to admin_article_path(@article), notice: "You have created book successfully."
    else
      render :new and return
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.admin_id = current_admin.id
    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: "You have updated book successfully."
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
