class ItemImagesController < ApplicationController

  def new
  end

  def create
    Item_image.create(image_params)
  end

  private
  def image_params
    params.require(:item_images).permit(:image_url)
  end

end
