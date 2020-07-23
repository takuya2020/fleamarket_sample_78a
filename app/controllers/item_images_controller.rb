class ItemImagesController < ApplicationController

  def new
    @item_image = Item_image.new
  end

  def create
    @item_image = Item_image.create(image_params)
  end

  private
  def image_params
    params.require(:item_images).permit(:image_url)
  end

end
