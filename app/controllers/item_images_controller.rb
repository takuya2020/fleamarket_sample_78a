class ItemImagesController < ApplicationController

  def create
    Item_image.create(image_params)
  end

  private
  def image_params
    params.require(:item_image).permit(:image_id, :image_url)
  end

end
