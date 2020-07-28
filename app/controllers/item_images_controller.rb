class ItemImagesController < ApplicationController

  def new
    @item_image = Item_image.new
  end

  def create
    @item_image = Item_image.create(image_params)
  end

  def edit
    @item_image = Item_image.find(params[:id])
  end

  def update
    @item_image = Item_image.find(params[:id])
    @item_image.update(image_params)
  end

  def destroy
    @item_image = Item_image.find(params[:id])
    @item_image.destroy
  end

  def show
    @item_image = Item_image.find(params[:id])
  end

  private
  def image_params
    params.require(:item_images).permit(:image_url)
  end

end
