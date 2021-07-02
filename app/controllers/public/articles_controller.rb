class Public::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @articles = Article.all.page(params[:page]).per(8).order(id: "DESC")
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.page(params[:page]).per(10).order(id: "DESC")
    gon.article = @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article), notice: "投稿しました"
    else
      render(:new) && return
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.user_id = current_user.id
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "更新しました"
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
    @articles = Article.search(params[:keyword]).page(params[:page]).per(8).order(id: "DESC")
    @keyword = params[:keyword]
    render "search"
  end

  def ranking # いいね数とスタンプ数のランキング4位までを表示
    @all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(4).pluck(:article_id))
    @stamp_ranks = Article.find(Stamp.group(:article_id).order('count(article_id) desc').limit(4).pluck(:article_id))
  end

  def mapping
  end

  def googlemap # 地図上にピンとそのリンク先を表示、県名を取得できるように
    @prefecture = params[:prefecture]
    @articles = Article.all
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
                                    :longitude)
  end
end
