class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo, notice: 'Photo was successfully uploaded.'
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def index
    if params[:search].present?
      @photos = Photo.by_description(params[:search]).limit(10)
    else
      @photos = Photo.all.limit(10)
    end
  end


  private

  def photo_params
    params.require(:photo).permit(:file)
  end
end
