class Public::ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "You have created book successfully."
    else
      render :new and return
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def article_params
    params.require(:article).permit(:name)
  end


end
