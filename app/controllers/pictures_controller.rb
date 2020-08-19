class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to new_picture_path
  end

  def show
    @picture = Picture.find(params[:id])
    biding.pry
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :content)
  end

end
