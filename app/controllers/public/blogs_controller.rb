class Public::BlogsController < ApplicationController
before_action :authenticate_user!
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path
    else
      render :new and return
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.user_id = current_user.id
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :image, :body, :memo, :start_time)
  end

end