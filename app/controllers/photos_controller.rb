class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo, notice: "Photo was successfully uploaded."
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def index
    if params[:text_search].present?
      @photos = Photo.by_description(params[:text_search])
    else
      @photos = Photo.all
    end
  end

  def image_search
    if params[:image_search].present?
      @photos = Photo.by_image(params[:image_search])
    else
      @photos = Photo.all
    end
    render :index
  end


  private

  def photo_params
    params.require(:photo).permit(:file)
  end
end
