class ImagesController < ApplicationController 
  before_action :set_image, only: :show

  def show
  end

  def create 
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save 
        format.html { redirect_to @image, notice: 'Image was successfully created' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
