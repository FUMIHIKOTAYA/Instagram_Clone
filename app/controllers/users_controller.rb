class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user.id)
      else
        render :new
      end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_update_params)
      redirect_to user_path, notice: %q(プロフィールを編集しました。)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,  :profile, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
