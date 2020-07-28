class ItemImagesController < ApplicationController
  before_action :set_item_image only: [:edit, :update, :destroy, :show]


  def new
    @item_image = Item_image.new
  end

  def create
    @item_image = Item_image.create(image_params)
  end

  def edit
  end

  def update
    @item_image.update(image_params)
  end

  def destroy
    @item_image.destroy
  end

  def show
  end

  private
  def image_params
    params.require(:item_images).permit(:image_url)
  end

  def set_item_image
    @item_image = Item_image.find(params[:id])
  end
end
