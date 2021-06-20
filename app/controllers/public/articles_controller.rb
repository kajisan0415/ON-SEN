class Public::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:update]

  def index
    @articles = Article.all.page(params[:page]).per(16)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.page(params[:page]).per(10)
    gon.article = @article
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

  def search
  @articles = Article.search(params[:keyword]).page(params[:page]).per(16)
  @keyword = params[:keyword]
  render "search"
  end

  def ranking #いいね数とスタンプ数のランキング4位までを表示
    @all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(4).pluck(:article_id))
    @stamp_ranks = Article.find(Stamp.group(:article_id).order('count(article_id) desc').limit(4).pluck(:article_id))
  end

  def mapping
  end

  def googlemap #地図上にピンとそのリンク先を表示、県名を取得できるように
     @articles = Article.all
     @prefecture = params[:prefecture]
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
    :introduction,
    :latitude,
    :longitude
    )
  end


end
