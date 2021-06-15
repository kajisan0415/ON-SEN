class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
        redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
