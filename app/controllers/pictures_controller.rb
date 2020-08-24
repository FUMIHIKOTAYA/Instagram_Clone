class PicturesController < ApplicationController
  before_action :set_picture, only: %i(show edit update destroy)
  before_action :limit_access, only: %i(edit update destroy)
  before_action :authenticate_user, only: %i(index)

  def index
    @pictures = Picture.all.order(id: %q(DESC))
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: %q(投稿しました。)
      else
        render :new
      end
    end
  end

  def show
      @favorite = current_user.favorites.find_by(picture_id: @picture.id)
    end

  def edit; end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: %q(投稿を編集しました。)
    else
      render :edit
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: %q(投稿を削除しました。)
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def limit_access
    @picture = Picture.find_by(id: params[:id])
    unless @picture.user_id == current_user.id
      redirect_to pictures_path, notice: %q(実行権限がありません。)
    end
  end

  def authenticate_user
    @current_user = User.find_by(id: session[:user_id])
    if @current_user == nil
      flash[:notice] = %q(ログインして始められます。)
      redirect_to new_session_path
    end
  end
end
