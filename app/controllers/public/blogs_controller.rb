class Public::BlogsController < ApplicationController
  before_action :authenticate_user!

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
      @user = @blog.user
      redirect_to calender_user_path(@user)
    else
      render(:new) && return
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    @user = @blog.user
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.user_id = current_user.id
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: "You have updated book successfully."
    else
      @user = @blog.user
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    @user = @blog.user
    redirect_to calender_user_path(@user)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :image, :body, :memo, :start_time)
  end
end
