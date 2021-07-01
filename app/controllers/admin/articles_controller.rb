class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @article = Article.find(params[:id])
    gon.article = @article
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
                                    :introduction)
  end
end
